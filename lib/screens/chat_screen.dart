// screens/chat_screen.dart
// This is the THIRD screen – An Instagram-style Direct Message view.

import 'package:flutter/material.dart';
import '../models/message.dart'; // Uses the enhanced ChatMessage model with type, imageUrl, etc.

class ChatScreen extends StatelessWidget {
  final String username;   // Instagram handle (e.g., alice_j)
  final String fullName;   // Profile display name
  final String avatarUrl;  // Profile picture URL

  const ChatScreen({
    super.key, 
    required this.username,
    required this.fullName,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Using a sleek, clean color palette (Dark or crisp light mode)
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final appBarTextColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      
      // ── AppBar ─────────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.5,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: appBarTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 18,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  style: TextStyle(color: appBarTextColor, fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  '@$username',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.videocam_outlined, color: appBarTextColor), onPressed: () {}),
          IconButton(icon: Icon(Icons.info_outline, color: appBarTextColor), onPressed: () {}),
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
                return _buildMessageBubble(context, message);
              },
            ),
          ),

          // ── Input Bar ────────────────────────────────────────────────────
          _buildInputBar(context),
        ],
      ),
    );
  }

  // ─── Helper: Chat Bubble ──────────────────────────────────────────────────
  Widget _buildMessageBubble(BuildContext context, ChatMessage message) {
    final alignment = message.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          _renderContentByType(context, message),
          
          // Instagram "Seen" receipt or timestamp under the bubble if applicable
          if (message.isSentByMe && message.isSeen)
            const Padding(
              padding: EdgeInsets.only(top: 2, right: 4),
              child: Text(
                'Seen',
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ),
        ],
      ),
    );
  }

  // Parses message type to return either a Text Gradient bubble, Image container, or Heart
  Widget _renderContentByType(BuildContext context, ChatMessage message) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    switch (message.type) {
      case MessageType.image:
        return ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 250, maxHeight: 300),
            child: Image.network(
              message.imageUrl ?? '',
              fit: BoxFit.cover,
            ),
          ),
        );

      case MessageType.heart:
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Icon(Icons.favorite, color: Colors.red, size: 40),
        );

      case MessageType.text:
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          constraints: const BoxConstraints(maxWidth: 260),
          decoration: BoxDecoration(
            // Instagram signature: Sent messages have a gradient. Received are solid gray/dark-gray.
            gradient: message.isSentByMe
                ? const LinearGradient(
                    colors: [Colors.purple, Colors.blueAccent],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
                : null,
            color: message.isSentByMe 
                ? null 
                : (isDarkMode ? Colors.grey[900] : Colors.grey[200]),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(22),
              topRight: const Radius.circular(22),
              bottomLeft: Radius.circular(message.isSentByMe ? 22 : 6),
              bottomRight: Radius.circular(message.isSentByMe ? 6 : 22),
            ),
          ),
          child: Text(
            message.text ?? '',
            style: TextStyle(
              fontSize: 15,
              color: message.isSentByMe 
                  ? Colors.white 
                  : (isDarkMode ? Colors.white : Colors.black),
            ),
          ),
        );
    }
  }

  // ─── Helper: Instagram Style Input Bar ────────────────────────────────────
  Widget _buildInputBar(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final iconColor = isDarkMode ? Colors.white : Colors.black;

    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 20, top: 8),
      color: isDarkMode ? Colors.black : Colors.white,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[900] : Colors.grey[100],
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            // Camera shortcut button
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blueAccent,
              child: IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.white, size: 16),
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 8),

            // Text input field
            Expanded(
              child: TextField(
                style: TextStyle(color: isDarkMode ? Colors.white : Colors.black),
                decoration: const InputDecoration(
                  hintText: 'Message...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),

            // Group of actions (Microphone, Gallery Image, Standalone Heart)
            IconButton(
              icon: Icon(Icons.mic_none, color: iconColor, size: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.image_outlined, color: iconColor, size: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.redAccent, size: 24),
              onPressed: () {
                // Instantly send a heart!
              },
            ),
          ],
        ),
      ),
    );
  }
}