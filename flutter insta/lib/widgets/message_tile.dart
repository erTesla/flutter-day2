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
      leading: Container(
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color(0xFFFEDA77), Color(0xFFE1306C), Color(0xFF833AB4)],
          ),
        ),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 21,
            backgroundColor: const Color(0xFFF2F2F2),
            child: Text(
              conversation.avatarLetter,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              conversation.name,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          Text(
            'Now',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: Text(
          conversation.lastMessage,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
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
    );
  }
}
