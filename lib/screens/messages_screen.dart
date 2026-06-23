// screens/messages_screen.dart
// A Direct Messages screen styled like Instagram's inbox.

import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/message_tile.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Direct'),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: sampleConversations.length,
        separatorBuilder: (context, index) => const Divider(height: 1, indent: 84, endIndent: 16),
        itemBuilder: (context, index) {
          final conversation = sampleConversations[index];
          return MessageTile(conversation: conversation);
        },
      ),
    );
  }
}
