// main.dart
// This is the ENTRY POINT of the Instagram-styled Flutter application.

import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Imports our newly designed Instagram Home Screen

void main() {
  runApp(const MyApp());
}

// MyApp configuration adjusted for an Instagram aesthetic.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram DMs',
      debugShowCheckedModeBanner: false,

      // ── Dark Theme Configuration (Instagram Default Style) ─────────────────
      // Instagram's dark mode uses true pitch-blacks (#000000) rather than deep grays.
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.blueAccent, // Used for active badges, action links
          surface: Colors.black,
        ),
        useMaterial3: true,
      ),

      // Optional: If you want a light theme instead, you can swap it here
      themeMode: ThemeMode.dark, 

      // The application launches directly into our updated Instagram Home Feed
      home: const HomeScreen(),
    );
  }
}