// models/message.dart
// This file defines the data models used throughout the app.
// A "model" is just a Dart class that holds structured data.

// ─── Conversation Model ───────────────────────────────────────────────────────
// Represents a single conversation entry shown in the Messages list screen.
class Conversation {
  final String name;         // The contact's name
  final String lastMessage;  // Preview of the most recent message
  final String avatarLetter; // Letter used to display the avatar circle
  final String time;         // Time shown on the conversation row
  final int unreadCount;     // Number of unread messages

  const Conversation({
    required this.name,
    required this.lastMessage,
    required this.avatarLetter,
    required this.time,
    required this.unreadCount,
  });
}

// ─── ChatMessage Model ────────────────────────────────────────────────────────
// Represents a single chat bubble inside the Chat Screen.
class ChatMessage {
  final String text;      // The text content of the message
  final bool isSentByMe;  // true = shown on the right (me), false = left (them)
  final String time;      // Timestamp shown below the message

  const ChatMessage({
    required this.text,
    required this.isSentByMe,
    required this.time,
  });
}

// ─── Sample Data ──────────────────────────────────────────────────────────────
// Hard-coded fake conversations shown in the Messages Screen.
// In a real app this data would come from a server or database.
final List<Conversation> sampleConversations = [
  Conversation(name: 'Abhishek',   lastMessage: 'da teacher ethyaa',          avatarLetter: 'A', time: '12:15', unreadCount: 2),
  Conversation(name: 'rizwan',     lastMessage: 'daaa nee jaichaaaaaa',        avatarLetter: 'R', time: '11:42', unreadCount: 4),
  Conversation(name: 'akshay',     lastMessage: 'enthaaan padich kaynjaa enikk pattniladaaaa', avatarLetter: 'A', time: '09:20', unreadCount: 0),
  Conversation(name: 'kamaran',    lastMessage: 'podey',                       avatarLetter: 'K', time: 'Yesterday', unreadCount: 1),
  Conversation(name: 'messi',      lastMessage: 'come play football with me please?', avatarLetter: 'M', time: '08:05', unreadCount: 0),
  Conversation(name: 'rajamouli',  lastMessage: 'bahubali 3 abinaykan veruoo 4 crore tharam....', avatarLetter: 'R', time: 'Mon', unreadCount: 3),
  Conversation(name: 'sydney sweedy', lastMessage: 'The meeting is at 3pm.',   avatarLetter: 'S', time: 'Sun', unreadCount: 0),
  Conversation(name: 'ronaldo',    lastMessage: 'Did you see the news,messi is real goat', avatarLetter: 'R', time: 'Fri', unreadCount: 5),
  Conversation(name: 'elon musk',  lastMessage: 'Just landed. Safe!',          avatarLetter: 'E', time: 'Thu', unreadCount: 0),
  Conversation(name: 'jensy teacher', lastMessage: 'study tommarow ',          avatarLetter: 'J', time: 'Wed', unreadCount: 6),
];

// Hard-coded fake chat messages shown inside the Chat Screen.
// These are reused for every conversation (it's a demo app).
final List<ChatMessage> sampleChatMessages = [
  ChatMessage(text: 'Hey! How are you?',               isSentByMe: false, time: '12:03 PM'),
  ChatMessage(text: 'I\'m good, thanks! You?',         isSentByMe: true,  time: '12:04 PM'),
  ChatMessage(text: 'Doing well! What\'s up?',         isSentByMe: false, time: '12:05 PM'),
  ChatMessage(text: 'Just working on a Flutter app 📱', isSentByMe: true,  time: '12:06 PM'),
  ChatMessage(text: 'Oh nice! How is it going?',       isSentByMe: false, time: '12:07 PM'),
  ChatMessage(text: 'Pretty well. Learning a lot!',    isSentByMe: true,  time: '12:08 PM'),
  ChatMessage(text: 'Flutter is awesome 🚀',           isSentByMe: false, time: '12:09 PM'),
  ChatMessage(text: 'Agreed! Love the hot reload.',    isSentByMe: true,  time: '12:10 PM'),
  ChatMessage(text: 'Let me know if you need help.',   isSentByMe: false, time: '12:11 PM'),
  ChatMessage(text: 'Will do. Thanks! 😊',             isSentByMe: true,  time: '12:12 PM'),
];
