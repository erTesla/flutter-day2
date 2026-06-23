// screens/home_screen.dart
// This is the FIRST screen users see when the app launches – transformed into an Instagram Style Feed view.

import 'package:flutter/material.dart';
import 'messages_screen.dart'; // Import the messages screen for inbox navigation

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? Colors.black : Colors.white;
    final iconColor = isDarkMode ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,

      // ── AppBar: Instagram Branded Top Header ──────────────────────────────
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.5,
        centerTitle: false,
        title: Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billboard', // In a real app, you would add Instagram's cursive font asset here
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: iconColor,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          // The iconic heart notification bell icon
          IconButton(
            icon: Icon(Icons.favorite_border, color: iconColor),
            onPressed: () {},
          ),
          // ── DM Navigation Action Button ──
          IconButton(
            icon: Icon(Icons.send_rounded, color: iconColor), // Looks like the signature DM paper airplane icon
            onPressed: () {
              // NAVIGATION: Pushes the Instagram Direct Messages (Inbox) screen on top of the stack
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MessagesScreen(),
                ),
              );
            },
          ),
        ],
      ),

      // ── Body: Simulated Instagram Feed Placeholder ────────────────────────
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Instagram styled placeholder icon
            Icon(
              Icons.camera_alt_outlined,
              size: 80,
              color: isDarkMode ? Colors.grey[700] : Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'Your Main Feed',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: iconColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap the paper airplane icon in the top right\ncorner to open your Direct Messages inbox.',
              style: TextStyle(
                fontSize: 14, 
                color: Colors.grey[600],
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}