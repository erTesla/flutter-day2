// screens/messages_screen.dart
// This is the SECOND screen – a scrollable list of conversations.
//
// WHAT IT CONTAINS:
//   • A modern AppBar with gradient styling
//   • A search bar to find conversations
//   • A ListView displaying 10 fake conversations
//   • Each conversation uses the reusable MessageTile widget
//   • Tapping a conversation navigates to the Chat Screen

import 'package:flutter/material.dart';
import '../models/message.dart'; // Sample conversation data
import '../widgets/message_tile.dart'; // Reusable tile widget

// MessagesScreen is StatefulWidget so it can rebuild when a conversation preview updates.
class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ── Modern Gradient AppBar ─────────────────────────────────────────────
      appBar: AppBar(
        title: const Text(
          'Messages',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            letterSpacing: 0.3,
          ),
        ),
        centerTitle: false,
        elevation: 8,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_square, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      // ── Body with gradient background ──────────────────────────────────────
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFAFBFC), Color(0xFFF5F7FA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // ── Search Bar ─────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF667EEA).withOpacity(0.1),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search conversations...',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
            ),

            // ── Message List ──────────────────────────────────────────────
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                itemCount: sampleConversations.length,
                itemBuilder: (context, index) {
                  final conversation = sampleConversations[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: MessageTile(conversation: conversation),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
