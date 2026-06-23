// widgets/message_tile.dart
// A reusable widget that displays one Instagram-style direct message row.

import 'package:flutter/material.dart';
import '../models/message.dart';
import '../screens/chat_screen.dart';

class MessageTile extends StatelessWidget {
  final Conversation conversation;

  const MessageTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade300,
            child: Text(
              conversation.avatarLetter,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ],
      ),
      title: Text(
        conversation.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        conversation.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: const Icon(Icons.camera_alt_outlined, color: Colors.grey),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              contactName: conversation.name,
              messages: sampleChatMessages,
            ),
          ),
        );
      },
    );
  }
}
