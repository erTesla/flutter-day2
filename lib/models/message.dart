import 'package:flutter/material.dart';

// models/message.dart
// This file defines the data models used for the Instagram-style UI.

class Conversation {
  final String name;
  final String lastMessage;
  final String avatarLetter;

  const Conversation({
    required this.name,
    required this.lastMessage,
    required this.avatarLetter,
  });
}

class ChatMessage {
  final String text;
  final bool isSentByMe;

  const ChatMessage({
    required this.text,
    required this.isSentByMe,
  });
}

class Story {
  final String name;
  final bool isLive;
  final Color color;

  const Story({
    required this.name,
    required this.isLive,
    required this.color,
  });
}

class Post {
  final String user;
  final String avatarLetter;
  final String location;
  final String caption;
  final String likes;
  final String timeAgo;
  final Color backgroundColor;

  const Post({
    required this.user,
    required this.avatarLetter,
    required this.location,
    required this.caption,
    required this.likes,
    required this.timeAgo,
    required this.backgroundColor,
  });
}

final List<Story> sampleStories = [
  const Story(name: 'anna', isLive: false, color: Color(0xFFAB47BC)),
  const Story(name: 'mason', isLive: true, color: Color(0xFF42A5F5)),
  const Story(name: 'julia', isLive: false, color: Color(0xFFFF7043)),
  const Story(name: 'nina', isLive: false, color: Color(0xFF66BB6A)),
  const Story(name: 'leo', isLive: true, color: Color(0xFFFDD835)),
  const Story(name: 'sophie', isLive: false, color: Color(0xFF26C6DA)),
];

final List<Post> samplePosts = [
  const Post(
    user: 'anna',
    avatarLetter: 'A',
    location: 'Los Angeles',
    caption: 'Golden hour on the boulevard. Loving the city light.',
    likes: '18.2k',
    timeAgo: '2h',
    backgroundColor: Color(0xFFBA68C8),
  ),
  const Post(
    user: 'mason',
    avatarLetter: 'M',
    location: 'Malibu',
    caption: 'Surf vibes and fresh air. Summer is calling.',
    likes: '9.4k',
    timeAgo: '4h',
    backgroundColor: Color(0xFF42A5F5),
  ),
  const Post(
    user: 'julia',
    avatarLetter: 'J',
    location: 'Paris',
    caption: 'Café mornings and croissant moments.',
    likes: '12.7k',
    timeAgo: '8h',
    backgroundColor: Color(0xFFFF8A65),
  ),
];

final List<Conversation> sampleConversations = [
  Conversation(name: 'Alice Johnson', lastMessage: 'See you tomorrow!', avatarLetter: 'A'),
  Conversation(name: 'Bob Smith', lastMessage: 'Can you send the file?', avatarLetter: 'B'),
  Conversation(name: 'Carol White', lastMessage: 'That sounds great 👍', avatarLetter: 'C'),
  Conversation(name: 'David Brown', lastMessage: 'On my way!', avatarLetter: 'D'),
  Conversation(name: 'Eva Martinez', lastMessage: 'Happy birthday!! 🎉', avatarLetter: 'E'),
  Conversation(name: 'Frank Lee', lastMessage: 'Let me check and get back.', avatarLetter: 'F'),
  Conversation(name: 'Grace Kim', lastMessage: 'The meeting is at 3pm.', avatarLetter: 'G'),
  Conversation(name: 'Henry Wilson', lastMessage: 'Did you see the news?', avatarLetter: 'H'),
  Conversation(name: 'Isla Thompson', lastMessage: 'Just landed. Safe!', avatarLetter: 'I'),
  Conversation(name: 'Jack Davis', lastMessage: 'Coffee tomorrow? ☕', avatarLetter: 'J'),
];

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
