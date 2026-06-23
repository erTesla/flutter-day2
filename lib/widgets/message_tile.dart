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
      // ── Leading: the round avatar circle on the left ──────────────────────
      leading: CircleAvatar(
        // Background color – students can change this later
        backgroundColor: Colors.purple,
        // Show the first letter of the contact's name
        child: Text(
          conversation.avatarLetter,
          style: const TextStyle(color: Colors.white),
        ),
      ),

      // ── Title: the contact's name ─────────────────────────────────────────
      title: Text(conversation.name),

      // ── Subtitle: preview of the last message ─────────────────────────────
      subtitle: Text(
        conversation.lastMessage,
        // Prevent long messages from wrapping to a second line
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
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
