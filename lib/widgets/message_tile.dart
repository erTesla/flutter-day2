// widgets/message_tile.dart
// A reusable widget that displays ONE conversation row in the Messages list.
//
// WHY A SEPARATE WIDGET?
// Instead of writing the same tile code 10 times inside the ListView,
// we extract it into its own widget so it can be reused and is easy to edit.

import 'package:flutter/material.dart';
import '../models/message.dart'; // Import the Conversation model
import '../screens/chat_screen.dart'; // Import Chat Screen for navigation

class MessageTile extends StatelessWidget {
  // The conversation data this tile should display
  final Conversation conversation;

  // Constructor – requires a conversation object
  const MessageTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    // ListTile is a built-in Flutter widget perfect for list rows.
    // It has built-in slots for a leading icon, title, subtitle, and trailing widget.
    return ListTile(
  contentPadding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 6,
  ),
  minVerticalPadding: 12,
      // ── Leading: the round avatar circle on the left ──────────────────────
      leading: Stack(
  children: [
    CircleAvatar(
      radius: 28,
      backgroundColor: Colors.grey.shade300,
      child: Text(
        conversation.avatarLetter,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
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
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      ),
  ],
),

      // ── Title: the contact's name ─────────────────────────────────────────
      title: Row(
  children: [
    Expanded(
      child: Text(
        conversation.name,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    ),

    Text(
      conversation.time,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    ),
  ],
),

      // ── Subtitle: preview of the last message ─────────────────────────────
      subtitle: Row(
  children: [
    Expanded(
      child: Text(
        conversation.lastMessage,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: Colors.grey.shade700,
        ),
      ),
    ),

    if (conversation.isUnread)
      Container(
        margin: const EdgeInsets.only(left: 8),
        width: 10,
        height: 10,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
  ],
),

      // ── onTap: what happens when the user taps this tile ──────────────────
      onTap: () {
        // NAVIGATION: Push the ChatScreen onto the navigation stack.
        // Navigator.push() adds a new screen on top of the current one.
        // The user can go back by pressing the back button (added automatically).
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              // Pass the contact name so the Chat Screen can display it in the AppBar
              contactName: conversation.name,
            ),
          ),
        );
      },
    );
  }
}
