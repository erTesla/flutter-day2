// screens/messages_screen.dart
// This is the SECOND screen – a scrollable list of conversations.
//
// WHAT IT CONTAINS:
//   • An AppBar titled "Messages"
//   • A ListView displaying 10 fake conversations
//   • Each conversation uses the reusable MessageTile widget
//   • Tapping a conversation navigates to the Chat Screen

import 'package:flutter/material.dart';
import '../models/message.dart';       // Sample conversation data
import '../widgets/message_tile.dart'; // Reusable tile widget

// MessagesScreen is StatelessWidget – the list is hard-coded so it never changes.
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
     
      // ── AppBar ─────────────────────────────────────────────────────────────
      appBar: AppBar(
         backgroundColor: Colors.black87,
         foregroundColor: Colors.purpleAccent,
        title: const Text('Messages'),
      ),

      // ── Body ───────────────────────────────────────────────────────────────
      // ListView.builder is the efficient way to display a scrollable list.
      // It only builds the widgets that are currently visible on screen.
      body: ListView.builder(
        // itemCount tells Flutter how many items are in the list.
        itemCount: sampleConversations.length, // 10 conversations

        // itemBuilder is called once per item to build each row widget.
        // "index" is the position in the list (0, 1, 2 … 9).
        itemBuilder: (context, index) {
          // Get the conversation at this index from our sample data list
          final conversation = sampleConversations[index];

          // Column + Divider adds a thin line between each conversation tile
          return Column(
            children: [
              // MessageTile is our custom reusable widget (see widgets/message_tile.dart)
              // We pass the conversation data in, and the tile handles display + navigation.
              MessageTile(conversation: conversation),
              

              // A thin horizontal divider line between rows (optional styling)
              const Divider(height: 1),
            ],
          );
        },
      ),
    );
  }
}
