// models/message.dart
// This file defines the data models used throughout the app.
// A "model" is just a Dart class that holds structured data.

// ─── Conversation Model ───────────────────────────────────────────────────────
// Represents a single conversation entry shown in the Messages list screen.
class Conversation {
  final String name;
  final String lastMessage;
  final String avatarLetter;

  // Instagram-like additions
  final bool isOnline;
  final bool isUnread;
  final String time;

  const Conversation({
    required this.name,
    required this.lastMessage,
    required this.avatarLetter,

    required this.isOnline,
    required this.isUnread,
    required this.time,
  });
}

// ─── ChatMessage Model ────────────────────────────────────────────────────────
// Represents a single chat bubble inside the Chat Screen.
class ChatMessage {
  final String text;      // The text content of the message
  final bool isSentByMe;  // true = shown on the right (me), false = left (them)

  const ChatMessage({
    required this.text,
    required this.isSentByMe,
  });
}

// ─── Sample Data ──────────────────────────────────────────────────────────────
// Hard-coded fake conversations shown in the Messages Screen.
// In a real app this data would come from a server or database.
final List<Conversation> sampleConversations = [
  Conversation(
    name: 'Alice Johnson',
    lastMessage: 'See you tomorrow!',
    avatarLetter: 'A',
    isOnline: true,
    isUnread: true,
    time: '2m',
  ),
  Conversation(
    name: 'Bob Smith',
    lastMessage: 'Can you send the file?',
    avatarLetter: 'B',
    isOnline: false,
    isUnread: false,
    time: '1h',
  ),
  Conversation(
    name: 'Carol White',
    lastMessage: 'That sounds great 👍',
    avatarLetter: 'C',
    isOnline: true,
    isUnread: true,
    time: '5m',
  ),
  Conversation(
    name: 'David Brown',
    lastMessage: 'On my way!',
    avatarLetter: 'D',
    isOnline: true,
    isUnread: false,
    time: '12m',
  ),
  Conversation(
    name: 'Eva Martinez',
    lastMessage: 'Happy birthday!! 🎉',
    avatarLetter: 'E',
    isOnline: false,
    isUnread: true,
    time: '20m',
  ),
  Conversation(
    name: 'Frank Lee',
    lastMessage: 'Let me check and get back.',
    avatarLetter: 'F',
    isOnline: true,
    isUnread: false,
    time: '45m',
  ),
  Conversation(
    name: 'Grace Kim',
    lastMessage: 'The meeting is at 3pm.',
    avatarLetter: 'G',
    isOnline: false,
    isUnread: false,
    time: '2h',
  ),
  Conversation(
    name: 'Henry Wilson',
    lastMessage: 'Did you see the news?',
    avatarLetter: 'H',
    isOnline: true,
    isUnread: true,
    time: '3h',
  ),
  Conversation(
    name: 'Isla Thompson',
    lastMessage: 'Just landed. Safe!',
    avatarLetter: 'I',
    isOnline: true,
    isUnread: false,
    time: '5h',
  ),
  Conversation(
    name: 'Jack Davis',
    lastMessage: 'Coffee tomorrow? ☕',
    avatarLetter: 'J',
    isOnline: false,
    isUnread: true,
    time: '1d',
  ),
];

// Hard-coded fake chat messages shown inside the Chat Screen.
// These are reused for every conversation (it's a demo app).
final List<ChatMessage> sampleChatMessages = [
  ChatMessage(text: 'Hey! How are you?',               isSentByMe: false),
  ChatMessage(text: 'I\'m good, thanks! You?',         isSentByMe: true),
  ChatMessage(text: 'Doing well! What\'s up?',         isSentByMe: false),
  ChatMessage(text: 'Just working on a Flutter app 📱', isSentByMe: true),
  ChatMessage(text: 'Oh nice! How is it going?',       isSentByMe: false),
  ChatMessage(text: 'Pretty well. Learning a lot!',    isSentByMe: true),
  ChatMessage(text: 'Flutter is awesome 🚀',           isSentByMe: false),
  ChatMessage(text: 'Agreed! Love the hot reload.',    isSentByMe: true),
  ChatMessage(text: 'Let me know if you need help.',   isSentByMe: false),
  ChatMessage(text: 'Will do. Thanks! 😊',             isSentByMe: true),
];
