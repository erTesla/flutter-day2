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

  Color _avatarColor() {
    final colors = [
      Colors.indigo,
      Colors.deepPurple,
      Colors.teal,
      Colors.cyan,
      Colors.pink,
      Colors.orange,
      Colors.blue,
      Colors.green,
    ];
    return colors[conversation.name.hashCode.abs() % colors.length].shade700;
  }

  String _avatarAnimal() {
    const animals = ['🐶', '🐱', '🦊', '🐼', '🐨', '🦁', '🐸', '🐵', '🐰', '🐯'];
    return animals[conversation.name.hashCode.abs() % animals.length];
  }

  @override
  Widget build(BuildContext context) {
    final avatarColor = _avatarColor();
    final animalEmoji = _avatarAnimal();
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: avatarColor,
              child: Text(
                animalEmoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Positioned(
              bottom: -2,
              right: -2,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300, width: 1.4),
                ),
                child: const Icon(
                  Icons.smart_toy,
                  size: 14,
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ],
        ),
        title: Text(
          conversation.name,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          conversation.lastMessage,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: Colors.grey.shade600),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              conversation.time,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            if (conversation.unreadCount > 0) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  conversation.unreadCount > 99 ? '99+' : conversation.unreadCount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(
                contactName: conversation.name,
              ),
            ),
          );
        },
      ),
    );
  }
}
