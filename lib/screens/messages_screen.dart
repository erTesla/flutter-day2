// screens/messages_screen.dart
// This is the direct messages list screen for the Instagram-style interface.

import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/message_tile.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: sampleConversations.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final conversation = sampleConversations[index];
        return MessageTile(conversation: conversation);
      },
    );
  }
}
