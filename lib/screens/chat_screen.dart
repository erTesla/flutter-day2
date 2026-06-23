// screens/chat_screen.dart
// This is the THIRD screen – a simple chat conversation view.
//
// WHAT IT CONTAINS:
//   • An AppBar showing the contact's name
//   • A scrollable list of static chat messages
//   • Messages from "me" appear on the RIGHT in blue
//   • Messages from the other person appear on the LEFT in grey
//   • A text input field + Send button at the bottom (no functionality)

import 'package:flutter/material.dart';
import '../models/message.dart'; // ChatMessage model + sample data

// ChatScreen receives the contact name from the Messages Screen via its constructor.
// This is how Flutter passes data between screens.
class ChatScreen extends StatelessWidget {
  final String contactName; // The name shown in the AppBar

  const ChatScreen({super.key, required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 0, 0, 0),
       
      
      // ── AppBar ─────────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(153, 0, 0, 0),
          foregroundColor: Colors.purpleAccent,
        
        // Display the contact's name passed in from the previous screen
        title: Text(contactName),
      ),

      // ── Body ───────────────────────────────────────────────────────────────
      // Column splits the screen into two parts:
      //   1. The message list (takes all remaining space)
      //   2. The input bar at the bottom (fixed height)
      body: Column(
        children: [
          // ── Message List ─────────────────────────────────────────────────
          // Expanded makes this widget fill all available vertical space
          // so the input bar stays pinned to the bottom.
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: sampleChatMessages.length,
              itemBuilder: (context, index) {
                final message = sampleChatMessages[index];
                // Build one chat bubble per message
                return _buildMessageBubble(message);
              },
            ),
          ),

          // ── Input Bar ────────────────────────────────────────────────────
          _buildInputBar(),
        ],
      ),
    );
  }

  // ─── Helper: Chat Bubble ──────────────────────────────────────────────────
  // Builds a single chat bubble widget.
  // Private methods start with _ by convention (they're only used inside this file).
  Widget _buildMessageBubble(ChatMessage message) {
    // Align right if sent by me, left if sent by the other person
    final alignment =
        message.isSentByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    // Blue for "me", grey for the other person
    final bubbleColor = message.isSentByMe ? const Color.fromARGB(255, 214, 28, 231) : Colors.grey[200];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        // crossAxisAlignment controls horizontal alignment inside the Column
        crossAxisAlignment: alignment,
        children: [
          // The bubble itself is a simple Container with rounded corners
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            // Limit bubble width so long messages don't span the full screen
            constraints: const BoxConstraints(maxWidth: 280),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              message.text,
              style: const TextStyle(fontSize: 15,color:Colors.black)
            ),
          ),
        ],
      ),
    );
  }

  // ─── Helper: Input Bar ────────────────────────────────────────────────────
  // Builds the message input area at the bottom of the screen.
  // The Send button has no functionality – students can add it later!
  Widget _buildInputBar() {
    return Container(
      // A light border on top to visually separate the input from messages
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          // ── Text Field ──────────────────────────────────────────────────
          // Expanded makes the TextField fill the remaining width
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message…',
                // OutlineInputBorder adds a visible border around the field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
            ),
          ),

          const SizedBox(width: 8), // Space between field and button

          // ── Send Button ─────────────────────────────────────────────────
          // IconButton wraps an icon and makes it tappable.
          // onPressed is empty (no functionality) – a student assignment!
          IconButton(
            icon: const Icon(Icons.send),
            color: Colors.purpleAccent,
            onPressed: () {
              // TODO: Students – add send functionality here!
              // Hint: You'll need to convert this to a StatefulWidget
              // and manage a TextEditingController.
            },
          ),
        ],
      ),
    );
  }
}
