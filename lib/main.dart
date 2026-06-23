// main.dart
// This is the ENTRY POINT of every Flutter application.
// Flutter calls main() first, which calls runApp() to start the widget tree.

import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Import our first screen

// main() is the entry point – Flutter starts here.
void main() {
  runApp(const MyApp());
}

// MyApp is the root widget of the entire application.
// It is a StatelessWidget because the app-level config never changes.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp sets up Material Design and the Navigator (screen stack).
    return MaterialApp(
      // The title appears in the device's task switcher
      title: 'Flutter Chat App',

      // debugShowCheckedModeBanner: false removes the red "DEBUG" banner
      debugShowCheckedModeBanner: false,

      // ThemeData controls the global look of the app.
      // Students can experiment with colorScheme and typography here!
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),

      // home is the first screen shown when the app starts.
      home: const HomeScreen(),
    );
  }
}
