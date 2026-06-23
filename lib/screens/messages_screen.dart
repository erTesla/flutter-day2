// screens/messages_screen.dart
import 'package:flutter/material.dart';
import '../models/message.dart'; // Sample conversation data
import '../widgets/message_tile.dart'; // Reusable tile widget

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Pure clean Instagram layout backdrop
      // ── AppBar ─────────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor:
            Colors.transparent, // Prevents Material 3 color shifts on scroll
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 22,
          ), // Sleeker back chevron
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        // FIXED: Removed 'const' prefix from the children array list definition entirely to prevent compiler errors
        title: Row(
          children: const [
            Text(
              'your_username',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 20),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.videocam_outlined,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.edit_note_outlined,
              color: Colors.black,
              size: 28,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),

      // ── Body ───────────────────────────────────────────────────────────────
      body: Column(
        children: [
          // ── Search Bar Section ─────────────────────────────────────────────
          _buildSearchBar(),

          // ── Expanded Scrollable View ───────────────────────────────────────
          Expanded(
            child: ListView.builder(
              itemCount:
                  sampleConversations.length +
                  2, // +2 slots BOTH Notes (0) and Sub-Header Labels (1)
              itemBuilder: (context, index) {
                if (index == 0) {
                  return _buildNotesSection();
                }

                if (index == 1) {
                  // Inserts the classic Instagram "Messages / Requests" toggle view split
                  return _buildMessageSectionHeader();
                }

                // Offset index by 2 to map correctly to data array list items
                final conversation = sampleConversations[index - 2];

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: MessageTile(conversation: conversation),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ─── Helper: Premium Muted Search Bar ──────────────────────────────────────
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: const Color(0xFFEFEFEF), // Authentic muted IG grey tint
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: const [
            SizedBox(width: 14),
            Icon(Icons.search, color: Colors.grey, size: 20),
            SizedBox(width: 10),
            Text(
              'Search',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ─── Helper: Instagram Message Section Header Titles ───────────────────────
  Widget _buildMessageSectionHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Messages',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            'Requests',
            style: TextStyle(
              color: Color(
                0xFF3797EF,
              ), // Highlighted IG Interactivity Blue link
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // ─── Helper: Vibrant Instagram Note Tray Component ────────────────────────
  Widget _buildNotesSection() {
    return Container(
      height: 125, // Breathing room for stacked element frame profiles
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Personal "Leave a Note" action bubble profile view
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
                        ),
                      ),
                      Positioned(
                        top: -6,
                        left: -4,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Text(
                            'Note...',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(1.5),
                          child: const CircleAvatar(
                            radius: 8,
                            backgroundColor: Color(0xFF3797EF),
                            child: Icon(
                              Icons.add,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your note',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          // Friends Notes configuration containing gradient framing layers
          final mockNotes = [
            "Thinking...",
            "Coffee? ☕",
            "Coding Flutter",
            "Bored",
            "Gym time 💪",
          ];
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Dynamic live active status indicator frame ring circle
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF2EA25E),
                            Color(0xFF67C959),
                          ], // Dynamic vibrant active green
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(1.5),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(
                            'https://i.pravatar.cc/150?img=${index + 20}',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -12,
                      left: -4,
                      right: -4,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Color(0xFFEFEFEF),
                              width: 0.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withBlue(46),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Text(
                            mockNotes[index - 1],
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // FIXED: Removed dynamic 'const' declaration that conflicted with Colors.black84 / string interpolation strings
                Text(
                  'friend_$index',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors
                        .lightGreenAccent, // Clean, legible Material-soft opacity text representation
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
