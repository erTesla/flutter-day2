// widgets/message_tile.dart
// A reusable widget that displays ONE Instagram-style conversation row in the Inbox list.

import 'package:flutter/material.dart';
import '../models/message.dart';       // Enhanced Conversation model
import '../screens/chat_screen.dart';   // Updated Chat Screen

class MessageTile extends StatelessWidget {
  final Conversation conversation;

  const MessageTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final mainTextColor = isDarkMode ? Colors.white : Colors.black;
    final hasUnread = conversation.unreadCount > 0;

    return InkWell(
      // InkWell gives a subtle tap ripple effect native to social apps
      onTap: () {
        // Navigates directly into the enhanced Instagram Chat view
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
            // ── Leading: Avatar Stack with Live Active Badge ─────────────────
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(conversation.avatarUrl),
                ),
                // Instagram signature: green dot border if the user is currently online
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

            // ── Center Content: Username & Message Metadata ──────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Instagram prioritizes handles (usernames) over full names in DMs
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
                      // Time stamp dot separator (e.g., "• 2h")
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

            // ── Trailing Indicators: Unread Status vs Camera Shortcut ────────
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