// screens/messages_screen.dart
// This is the SECOND screen – Transformed into an Instagram Direct Messages (Inbox) Screen.

import 'package:flutter/material.dart';
import '../models/message.dart'; // Enhanced Conversation model with online status, badges, etc.
import 'chat_screen.dart';       // Navigates directly to the redesigned ChatScreen

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,

      // ── AppBar: Instagram Inbox Header ──────────────────────────────────────
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Text(
              'Messages',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, color: textColor, size: 20), // Fixed syntax typo here
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.video_call_outlined, color: textColor, size: 28), onPressed: () {}),
          IconButton(icon: Icon(Icons.open_in_new_rounded, color: textColor, size: 24), onPressed: () {}),
        ],
      ),

      // ── Body ───────────────────────────────────────────────────────────────
      body: Column(
        children: [
          // 1. Instagram Search Bar
          _buildSearchBar(context),

          // 2. Main Scrollable Inbox List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8),
              itemCount: sampleConversations.length,
              itemBuilder: (context, index) {
                final conversation = sampleConversations[index];
                return _buildInstagramMessageTile(context, conversation);
              },
            ),
          ),
        ],
      ),
    );
  }

  // ─── Helper: Instagram Search Bar ──────────────────────────────────────────
  Widget _buildSearchBar(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }

  // ─── Helper: Inline Instagram Style Message Tile ───────────────────────────
  Widget _buildInstagramMessageTile(BuildContext context, Conversation conversation) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final mainTextColor = isDarkMode ? Colors.white : Colors.black;
    final hasUnread = conversation.unreadCount > 0;

    return InkWell(
      onTap: () {
        // Navigates straight into the redesigned Instagram Chat UI
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              username: conversation.username,
              fullName: conversation.fullName,
              avatarUrl: conversation.avatarUrl,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            // Avatar stack containing profile photo and optional active green dot
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(conversation.avatarUrl),
                ),
                if (conversation.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDarkMode ? Colors.black : Colors.white,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),

            // Middle Column containing Username, Full Name, and Last message metadata
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conversation.username,
                    style: TextStyle(
                      color: mainTextColor,
                      fontSize: 15,
                      fontWeight: hasUnread ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: hasUnread ? mainTextColor : Colors.grey,
                            fontSize: 14,
                            fontWeight: hasUnread ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '• ${conversation.timeString}',
                        style: const TextStyle(color: Colors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // Right side indicators: Blue dot for unread status, Camera icon for easy replies
            if (hasUnread)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
              )
            else
              Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey[500],
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}