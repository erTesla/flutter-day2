import 'package:flutter/material.dart';
import '../models/message.dart';
import '../screens/chat_screen.dart';

class MessageTile extends StatelessWidget {
  final Conversation conversation;

  const MessageTile({super.key, required this.conversation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Colors.orange, Colors.pink],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundImage: NetworkImage(conversation.avatarUrl),
          ),
        ),
      ),
      title: Text(
        conversation.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        conversation.lastMessage,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: Text(
        conversation.time,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(contactName: conversation.name),
          ),
        );
      },
    );
  }
}
