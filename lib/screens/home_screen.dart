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

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the basic visual structure: AppBar + body area.
    return Scaffold(
      backgroundColor:Colors.black,
      // ── AppBar ─────────────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Instagram',style:TextStyle(color:Colors.white)),
      ),

      // ── Body ───────────────────────────────────────────────────────────────
      // Center aligns its child widget both horizontally and vertically.
      body: Center(
        // Column stacks widgets vertically.
        child: Column(
          // mainAxisAlignment controls how children are spaced along the vertical axis.
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ── Welcome icon ───────────────────────────────────────────────
            const Icon(
              Icons.camera_alt,
              size: 80,
              color: Colors.white,
            ),

            const SizedBox(height: 24), // Empty space between widgets

            // ── Welcome text ───────────────────────────────────────────────
            const Text(
              'Instagram',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,color: Colors.purple
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Tap the button below to see your messages.',
              style: TextStyle(fontSize: 14, color: Colors.purple),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 40),

            // ── Navigation button ──────────────────────────────────────────
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, side: const BorderSide(color: Colors.purple,   width: 2.0,            
    ),
  ),

              onPressed: () {
                // NAVIGATION: Navigator.push() opens a new screen.
                // Think of it like stacking screens on top of each other.
                // The user presses the back button to return to this screen.
                Navigator.push(
                  context,
                  // MaterialPageRoute wraps the new screen with a slide animation.
                  MaterialPageRoute(
                    builder: (context) => const MessagesScreen(),
                  ),
                );
              },
              child: const Text('Open Messages'),
            ),
          ],
        ),
      ),
    );
  }
}
