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
    backgroundColor: Colors.white,

    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,

      title: const Row(
        children: [
          Text(
            'gokul_nr',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.black,
          ),
        ],
      ),

      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.edit_outlined,
            color: Colors.black,
          ),
        ),
      ],
    ),

    body: Column(
      children: [

        // SEARCH BAR
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',

              prefixIcon: const Icon(Icons.search),

              filled: true,
              fillColor: const Color(0xFFF2F2F2),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),

        // STORIES ROW
        SizedBox(
          height: 95,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),

            itemCount: sampleConversations.length,

            itemBuilder: (context, index) {
              final conversation = sampleConversations[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [

                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade300,
                      child: Text(
                        conversation.avatarLetter,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    SizedBox(
                      width: 60,
                      child: Text(
                        conversation.name.split(' ').first,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Messages',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'Requests',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: sampleConversations.length,

            itemBuilder: (context, index) {
              final conversation = sampleConversations[index];

              return MessageTile(
                conversation: conversation,
              );
            },
          ),
        ),
      ],
    ),
  );
}
}