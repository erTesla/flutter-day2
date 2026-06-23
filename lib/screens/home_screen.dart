// screens/home_screen.dart
// This is the FIRST screen users see when the app launches.
//
// WHAT IT CONTAINS:
//   • An AppBar with the app title
//   • A welcome message
//   • A button that navigates to the Messages Screen

import 'package:flutter/material.dart';
import 'messages_screen.dart'; // Import the next screen for navigation

// HomeScreen is a StatelessWidget because it has no changing state –
// it always looks the same every time it is built.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget _buildFloatingIcon(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.18),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Icon(icon, color: color, size: 28),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic visual structure: AppBar + body area.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5B3B92),
        elevation: 0,
        title: const Text('Flutter Chat App'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF4F2B9E), Color(0xFF8E44AD)],
              ),
            ),
          ),
          ...List.generate(50, (index) {
            const icons = [
              Icons.message,
              Icons.mark_chat_unread,
              Icons.send,
              Icons.favorite,
              Icons.chat,
              Icons.comment,
              Icons.add_reaction,
              Icons.campaign,
            ];
            const colors = [
              Color(0xFFFFA726),
              Color(0xFF42A5F5),
              Color(0xFF26A69A),
              Color(0xFFEC407A),
              Color(0xFFAB47BC),
              Color(0xFF29B6F6),
              Color(0xFFFB8C00),
              Color(0xFF6D4C41),
            ];
            final icon = icons[index % icons.length];
            final color = colors[index % colors.length];
            final top = 40.0 + (index * 22) % 360;
            final left = 14.0 + (index * 26) % 260;
            final right = 20.0 + (index * 19) % 180;
            final useRight = index % 3 == 0;

            return Positioned(
              top: top,
              left: useRight ? null : left,
              right: useRight ? right : null,
              child: _buildFloatingIcon(icon, color),
            );
          }),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 22,
                        offset: const Offset(0, 12),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.chat_bubble_outline,
                        size: 90,
                        color: Color(0xFF8E44AD),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Welcome to Flutter Chat!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Whenever you need to message, try me.',
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MessagesScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                        ),
                        child: const Text(
                          'Open Messages',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
