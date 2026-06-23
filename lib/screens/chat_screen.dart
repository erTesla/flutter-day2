// screens/chat_screen.dart
// This is the THIRD screen – a chat conversation view with working send behavior.
//
// WHAT IT CONTAINS:
//   • A colored AppBar with contact avatar and status
//   • A scrollable list of messages with sent/received styling
//   • A working text input field and send button
//   • Auto-scroll to the newest message

import 'package:flutter/material.dart';
import '../models/message.dart'; // ChatMessage model + sample data

// ChatScreen receives the contact name from the Messages Screen via its constructor.
// This is how Flutter passes data between screens.
class ChatScreen extends StatefulWidget {
  final String contactName; // The name shown in the AppBar

  const ChatScreen({super.key, required this.contactName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late List<ChatMessage> _messages;
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    _messages = List<ChatMessage>.from(sampleChatMessages);
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  String _formatTime(DateTime time) {
    final hour = time.hour == 0 ? 12 : (time.hour > 12 ? time.hour - 12 : time.hour);
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  void _sendMessage() {
    final messageText = _messageController.text.trim();
    if (messageText.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(
        text: messageText,
        isSentByMe: true,
        time: _formatTime(DateTime.now()),
      ));
      _messageController.clear();
      _isTyping = false;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueGrey.shade700,
              child: Text(
                widget.contactName.isNotEmpty ? widget.contactName[0].toUpperCase() : '',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contactName,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 17),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Active now',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call_outlined),
            color: Colors.black87,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call_outlined),
            color: Colors.black87,
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              itemCount: _messages.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final message = _messages[index];
                final showDivider = index == 0 || _messages[index - 1].time != message.time;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (index == 0) ...[
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE9E6FF),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Today',
                            style: TextStyle(color: Color(0xFF5B3B92), fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                    _buildMessageBubble(message),
                  ],
                );
              },
            ),
          ),
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Row(
                children: [
                  const SizedBox(width: 6),
                  const Icon(Icons.edit, size: 16, color: Colors.grey),
                  const SizedBox(width: 8),
                  Text(
                    'Typing...',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                  ),
                ],
              ),
            ),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    final isMe = message.isSentByMe;
    final bubbleRadius = BorderRadius.only(
      topLeft: const Radius.circular(18),
      topRight: const Radius.circular(18),
      bottomLeft: Radius.circular(isMe ? 18 : 4),
      bottomRight: Radius.circular(isMe ? 4 : 18),
    );

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (!isMe) ...[
          const CircleAvatar(
            radius: 14,
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.person, size: 16, color: Colors.white),
          ),
          const SizedBox(width: 8),
        ],
        Flexible(
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: isMe ? null : Colors.white,
                  gradient: isMe
                      ? const LinearGradient(
                          colors: [Color(0xFF6148E3), Color(0xFF6A2FFC)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  borderRadius: bubbleRadius,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  message.text,
                  style: TextStyle(
                    fontSize: 15,
                    color: isMe ? Colors.white : Colors.black87,
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                message.time,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInputBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_outlined),
            color: Colors.blueGrey,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F8),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      textInputAction: TextInputAction.send,
                      onChanged: (value) {
                        setState(() {
                          _isTyping = value.trim().isNotEmpty;
                        });
                      },
                      onSubmitted: (_) => _sendMessage(),
                      decoration: const InputDecoration(
                        hintText: 'Message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.image_outlined),
                    color: Colors.blueGrey,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.mic_none),
                    color: Colors.blueGrey,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF6148E3),
            ),
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
