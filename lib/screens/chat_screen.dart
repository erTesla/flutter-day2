import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/message.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;

  const ChatScreen({super.key, required this.contactName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late List<ChatMessage> _messages;
  final TextEditingController _controller = TextEditingController();
  bool _isTyping = false;
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();
    _messages = List.from(sampleChatMessages);
  }

  @override
  void dispose() {
    _controller.dispose();
    _typingTimer?.cancel();
    super.dispose();
  }

  void _onTextChanged(String v) {
    _typingTimer?.cancel();
    if (v.isNotEmpty && !_isTyping) {
      setState(() => _isTyping = true);
    }
    _typingTimer = Timer(const Duration(milliseconds: 1200), () {
      if (mounted) setState(() => _isTyping = false);
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    final msg = ChatMessage(id: DateTime.now().millisecondsSinceEpoch.toString(), text: text, isSentByMe: true, status: MessageStatus.sending);
    setState(() {
      _messages.add(msg);
      _controller.clear();
      _isTyping = false;
    });

    // simulate sending lifecycle
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      setState(() {
        msg.status = MessageStatus.sent;
      });
    });
    Future.delayed(const Duration(milliseconds: 900), () {
      if (!mounted) return;
      setState(() {
        msg.status = MessageStatus.delivered;
      });
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      setState(() {
        msg.status = MessageStatus.read;
      });
    });
  }

  void _showReactions(ChatMessage msg) async {
    final reaction = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['❤️', '😂', '😮', '😢', '🔥', '👍'].map((e) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(e),
                child: Text(e, style: const TextStyle(fontSize: 28)),
              );
            }).toList(),
          ),
        );
      },
    );
    if (!mounted) return;
    if (reaction != null) {
      setState(() => msg.reaction = reaction);
    }
  }

  void _showMessageActions(ChatMessage msg) async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(children: [
            ListTile(leading: const Icon(Icons.reply), title: const Text('Reply'), onTap: () => Navigator.of(context).pop('reply')),
            ListTile(leading: const Icon(Icons.copy), title: const Text('Copy'), onTap: () => Navigator.of(context).pop('copy')),
            ListTile(leading: const Icon(Icons.delete_outline), title: const Text('Delete'), onTap: () => Navigator.of(context).pop('delete')),
            ListTile(leading: const Icon(Icons.close), title: const Text('Cancel'), onTap: () => Navigator.of(context).pop()),
          ]),
        );
      },
    );
    if (!mounted) return;
    if (choice == 'copy') {
      final messenger = ScaffoldMessenger.of(context);
      await Clipboard.setData(ClipboardData(text: msg.text));
      messenger.showSnackBar(const SnackBar(content: Text('Copied')));
    } else if (choice == 'delete') {
      setState(() => _messages.removeWhere((m) => m.id == msg.id));
    } else if (choice == 'reply') {
      // simple UI hint: prefill input with reply reference
      _controller.text = 'Replying: ${msg.text}';
      _controller.selection = TextSelection.collapsed(offset: _controller.text.length);
    }
  }

  Widget _statusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sending:
        return const Icon(Icons.access_time, size: 14, color: Colors.grey);
      case MessageStatus.sent:
        return const Icon(Icons.check, size: 14, color: Colors.grey);
      case MessageStatus.delivered:
        return const Icon(Icons.done_all, size: 14, color: Colors.grey);
      case MessageStatus.read:
        return const Icon(Icons.done_all, size: 14, color: Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xFFFEDA77), Color(0xFFE1306C), Color(0xFF833AB4)],
                ),
              ),
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 18, color: Colors.black54),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.contactName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                Text('Active now', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
        ],
      ),
      body: Container(
        color: const Color(0xFFF8F8F8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                itemCount: _messages.length + (_isTyping ? 1 : 0),
                itemBuilder: (context, index) {
                  if (_isTyping && index == _messages.length) {
                    return _buildTypingIndicator();
                  }
                  final msg = _messages[index];
                  return GestureDetector(
                    onLongPress: () => _showReactions(msg),
                    onTap: () => _showMessageActions(msg),
                    child: _messageRow(context, msg),
                  );
                },
              ),
            ),
            _buildInputBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Color(0xFFFEDA77), Color(0xFFE1306C), Color(0xFF833AB4)]),
            ),
            child: const CircleAvatar(radius: 16, backgroundColor: Colors.white, child: Icon(Icons.person, size: 16)),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
            child: const Text('Typing…', style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }

  Widget _messageRow(BuildContext context, ChatMessage message) {
    final time = TimeOfDay.fromDateTime(message.timestamp).format(context);
    if (message.isSentByMe) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFFE1306C), Color(0xFFF56040)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(6), bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18)),
                      boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.06), blurRadius: 8, offset: const Offset(0, 4))],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(message.text, style: const TextStyle(color: Colors.white, fontSize: 15)),
                        if (message.reaction != null) Text(message.reaction!, style: const TextStyle(fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                    const SizedBox(width: 6),
                    _statusIcon(message.status),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    // incoming message
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xFFFEDA77), Color(0xFFE1306C), Color(0xFF833AB4)])),
            child: CircleAvatar(radius: 18, backgroundColor: Colors.white, child: Text('A', style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.black87))),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(18), bottomLeft: Radius.circular(18), bottomRight: Radius.circular(18)), boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.03), blurRadius: 6, offset: const Offset(0, 3))]),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(message.text, style: const TextStyle(color: Colors.black87, fontSize: 15)),
                    if (message.reaction != null) Text(message.reaction!, style: const TextStyle(fontSize: 18)),
                  ]),
                ),
              ),
              const SizedBox(height: 6),
              Text(time, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
        decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey.shade200))),
        child: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.photo_library_outlined)),
            Expanded(
              child: TextField(
                controller: _controller,
                onChanged: _onTextChanged,
                decoration: InputDecoration(hintText: 'Message...', filled: true, fillColor: const Color(0xFFF3F3F3), border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none), contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: const BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: [Color(0xFFE1306C), Color(0xFFF56040)])),
              child: IconButton(icon: const Icon(Icons.send, color: Colors.white), onPressed: _sendMessage),
            ),
          ],
        ),
      ),
    );
  }
}
