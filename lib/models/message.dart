// models/message.dart
// This file defines the data models used throughout the app.
// A "model" is just a Dart class that holds structured data.

// ─── Conversation Model ───────────────────────────────────────────────────────
// Represents a single conversation entry shown in the Messages list screen.
class Conversation {
  final String name;
  final String lastMessage;
  final String avatarUrl;
  final String time;

  const Conversation({
    required this.name,
    required this.lastMessage,
    required this.avatarUrl,
    required this.time,
  });
}

// ─── ChatMessage Model ─────────────────────────────────────────────────────────
// Represents a single chat bubble inside the Chat Screen.
class ChatMessage {
  final String text;
  final bool isSentByMe;

  const ChatMessage({
    required this.text,
    required this.isSentByMe,
  });
}

// ─── Sample Data ──────────────────────────────────────────────────────────────
final List<Conversation> sampleConversations = [
  const Conversation(
    name: 'Anu',
    lastMessage: 'Hey! How are you?',
    avatarUrl: 'https://i.pravatar.cc/150?img=2',
    time: '2m',
  ),
  const Conversation(
    name: 'Maya',
    lastMessage: 'Let’s meet tomorrow 😊',
    avatarUrl: 'https://i.pravatar.cc/150?img=3',
    time: '10m',
  ),
  const Conversation(
    name: 'Akhil',
    lastMessage: 'Sent a reel',
    avatarUrl: 'https://i.pravatar.cc/150?img=4',
    time: '1h',
  ),
  const Conversation(
    name: 'Diya',
    lastMessage: 'Typing...',
    avatarUrl: 'https://i.pravatar.cc/150?img=5',
    time: '3h',
  ),
  const Conversation(
    name: 'Rahul',
    lastMessage: 'See you soon!',
    avatarUrl: 'https://i.pravatar.cc/150?img=6',
    time: '5h',
  ),
];

final List<ChatMessage> sampleChatMessages = [
  const ChatMessage(text: 'Hey! How are you?', isSentByMe: false),
  const ChatMessage(text: 'I\'m good, thanks! You?', isSentByMe: true),
  const ChatMessage(text: 'Doing well! What\'s up?', isSentByMe: false),
  const ChatMessage(text: 'Just working on a Flutter app 📱', isSentByMe: true),
  const ChatMessage(text: 'Oh nice! How is it going?', isSentByMe: false),
  const ChatMessage(text: 'Pretty well. Learning a lot!', isSentByMe: true),
  const ChatMessage(text: 'Flutter is awesome 🚀', isSentByMe: false),
  const ChatMessage(text: 'Agreed! Love the hot reload.', isSentByMe: true),
  const ChatMessage(text: 'Let me know if you need help.', isSentByMe: false),
  const ChatMessage(text: 'Will do. Thanks! 😊', isSentByMe: true),
];
