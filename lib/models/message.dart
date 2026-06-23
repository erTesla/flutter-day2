// models/message.dart
// This file defines the data models used throughout the app.
// A "model" is just a Dart class that holds structured data.

// ─── Conversation Model ───────────────────────────────────────────────────────
// Represents a single conversation entry shown in the Messages list screen.
class Conversation {
  final String name; // The contact's name
  String lastMessage; // Preview of the most recent message
  final String avatarLetter; // Letter used to display the avatar circle

  // Constructor: called when creating a new Conversation object.
  // The "required" keyword means these fields must always be provided.
  Conversation({
    required this.name,
    required this.lastMessage,
    required this.avatarLetter,
  });
}

// ─── ChatMessage Model ────────────────────────────────────────────────────────
// Represents a single chat bubble inside the Chat Screen.
class ChatMessage {
  final String text; // The text content of the message
  final bool isSentByMe; // true = shown on the right (me), false = left (them)

  const ChatMessage({required this.text, required this.isSentByMe});
}

// ─── Sample Data ──────────────────────────────────────────────────────────────
// Hard-coded fake conversations shown in the Messages Screen.
// In a real app this data would come from a server or database.
final List<Conversation> sampleConversations = [
  Conversation(
    name: 'Alice Johnson',
    lastMessage: 'See you tomorrow!',
    avatarLetter: 'A',
  ),
  Conversation(
    name: 'Bob Smith',
    lastMessage: 'Can you send the file?',
    avatarLetter: 'B',
  ),
  Conversation(
    name: 'Carol White',
    lastMessage: 'That sounds great 👍',
    avatarLetter: 'C',
  ),
  Conversation(
    name: 'David Brown',
    lastMessage: 'On my way!',
    avatarLetter: 'D',
  ),
  Conversation(
    name: 'Eva Martinez',
    lastMessage: 'Happy birthday!! 🎉',
    avatarLetter: 'E',
  ),
  Conversation(
    name: 'Frank Lee',
    lastMessage: 'Let me check and get back.',
    avatarLetter: 'F',
  ),
  Conversation(
    name: 'Grace Kim',
    lastMessage: 'The meeting is at 3pm.',
    avatarLetter: 'G',
  ),
  Conversation(
    name: 'Henry Wilson',
    lastMessage: 'Did you see the news?',
    avatarLetter: 'H',
  ),
  Conversation(
    name: 'Isla Thompson',
    lastMessage: 'Just landed. Safe!',
    avatarLetter: 'I',
  ),
  Conversation(
    name: 'Jack Davis',
    lastMessage: 'Coffee tomorrow? ☕',
    avatarLetter: 'J',
  ),
];

// Hard-coded fake chat messages shown inside the Chat Screen.
// These are reused for every conversation (it's a demo app).
final List<ChatMessage> sampleChatMessages = [
  ChatMessage(text: 'Hey! How are you?', isSentByMe: false),
  ChatMessage(text: 'I\'m good, thanks! You?', isSentByMe: true),
  ChatMessage(text: 'Doing well! What\'s up?', isSentByMe: false),
  ChatMessage(text: 'Just working on a Flutter app 📱', isSentByMe: true),
  ChatMessage(text: 'Oh nice! How is it going?', isSentByMe: false),
  ChatMessage(text: 'Pretty well. Learning a lot!', isSentByMe: true),
  ChatMessage(text: 'Flutter is awesome 🚀', isSentByMe: false),
  ChatMessage(text: 'Agreed! Love the hot reload.', isSentByMe: true),
  ChatMessage(text: 'Let me know if you need help.', isSentByMe: false),
  ChatMessage(text: 'Will do. Thanks! 😊', isSentByMe: true),
];
