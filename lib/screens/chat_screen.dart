// screens/chat_screen.dart
import 'package:flutter/material.dart';
import '../models/message.dart'; // ChatMessage model + sample data

class ChatScreen extends StatelessWidget {
  final String contactName; // The name shown in the AppBar

  const ChatScreen({super.key, required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Pure white background throughout
      // ── AppBar ─────────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5, // Crisp, thin border line
        iconTheme: const IconThemeData(color: Colors.black),
        titleSpacing: 0, // Pulls avatar closer to back button
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?name=$contactName', // Dynamically grabs placeholder
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contactName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Active now',
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),

      // ── Body ───────────────────────────────────────────────────────────────
      body: Column(
        children: [
          // ── Message List ─────────────────────────────────────────────────
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              itemCount: sampleChatMessages.length,
              itemBuilder: (context, index) {
                final message = sampleChatMessages[index];
                return _buildInstagramMessageBubble(message);
              },
            ),
          ),

          // ── Input Bar ────────────────────────────────────────────────────
          _buildInstagramInputBar(),
        ],
      ),
    );
  }

  // ─── Helper: Instagram Style Chat Bubble ──────────────────────────────────
  Widget _buildInstagramMessageBubble(ChatMessage message) {
    final isMe = message.isSentByMe;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          // If message is from someone else, we show their micro avatar on the left
          if (!isMe) ...[
            CircleAvatar(
              radius: 11,
              backgroundImage: NetworkImage(
                'https://i.pravatar.cc/150?name=$contactName',
              ),
            ),
            const SizedBox(width: 8),
          ],

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            constraints: const BoxConstraints(maxWidth: 260),
            decoration: BoxDecoration(
              // Instagram uses a clean blue color or a gradient for "Me"
              color: isMe ? const Color(0xFF3797EF) : const Color(0xFFEFEFEF),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: Radius.circular(isMe ? 20 : 4),
                bottomRight: Radius.circular(isMe ? 4 : 20),
              ),
            ),
            child: Text(
              message.text,
              style: TextStyle(
                fontSize: 15,
                // Sent text is white, received text is black
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Helper: Instagram Style Rounded Pill Input Bar ────────────────────────
  Widget _buildInstagramInputBar() {
    return SafeArea(
      // Ensures compatibility with bottom screen notches
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFFAFAFA), // Off-white field fill color
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: Colors.grey.shade200, width: 1.5),
          ),
          child: Row(
            children: [
              // Camera / Mic shortcut container icon
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFF3797EF),
                  child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
                ),
              ),

              const SizedBox(width: 4),

              // ── Text Input Area ────────────────────────────────────────────
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Message...',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 15,
                    ),
                    border: InputBorder.none, // Strip standard border lines
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),

              // Right-hand side helper action media items
              IconButton(
                icon: const Icon(Icons.mic_none, color: Colors.black, size: 22),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.image_outlined,
                  color: Colors.black,
                  size: 22,
                ),
                onPressed: () {},
              ),

              // Instagram styled Text "Send" action link
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Send',
                  style: TextStyle(
                    color: Color(0xFF3797EF),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
