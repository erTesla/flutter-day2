// models/message.dart
// This file defines enhanced data models to mimic an Instagram-style chat experience.

// ─── Message Type Enum ───────────────────────────────────────────────────────
// Instagram messages aren't just text; they can be images, voice notes, or likes.
enum MessageType { text, image, heart }

// ─── Conversation Model ───────────────────────────────────────────────────────
// Represents an Instagram Direct Message (DM) thread in the inbox.
class Conversation {
  final String username; // Instagram handle (e.g., @alice_j)
  final String fullName; // Display name (e.g., Alice Johnson)
  final String avatarUrl; // URL for the profile picture
  final String lastMessage; // Preview text of the latest message
  final String timeString; // Time elapsed (e.g., "Active 2h ago", "1m")
  final bool isOnline; // Green dot status indicator
  final int unreadCount; // Number of unread messages (blue dot badge)
  final bool lastMessageSentByMe; // To show "Sent" vs "Seen" or just the text

  const Conversation({
    required this.username,
    required this.fullName,
    required this.avatarUrl,
    required this.lastMessage,
    required this.timeString,
    required this.isOnline,
    required this.unreadCount,
    required this.lastMessageSentByMe,
  });
}

// ─── ChatMessage Model ────────────────────────────────────────────────────────
// Represents an individual message bubble inside an Instagram DM thread.
class ChatMessage {
  final String? text; // Null if the message is purely an image/heart
  final String? imageUrl; // URL if a photo was sent
  final MessageType type; // Defines how the bubble renders (text, image, heart)
  final bool
  isSentByMe; // true = Right side (purple/blue gradient), false = Left side (grey)
  final String timestamp; // Small time indicator under or between bubbles
  final bool isSeen; // Shows "Seen" under the very last message sent by you

  const ChatMessage({
    this.text,
    this.imageUrl,
    required this.type,
    required this.isSentByMe,
    required this.timestamp,
    this.isSeen = false,
  });
}

// ─── Sample Data ──────────────────────────────────────────────────────────────
// Hard-coded Instagram-themed mock data.

final List<Conversation> sampleConversations = [
  const Conversation(
    username: 'alice_j',
    fullName: 'Alice Johnson',
    avatarUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
    lastMessage: 'Active 2m ago',
    timeString: '2m',
    isOnline: true,
    unreadCount: 2,
    lastMessageSentByMe: false,
  ),
  const Conversation(
    username: 'bob_smith',
    fullName: 'Bob Smith',
    avatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
    lastMessage: 'Liked a message',
    timeString: '1h',
    isOnline: false,
    unreadCount: 0,
    lastMessageSentByMe: true,
  ),
  const Conversation(
    username: 'carol_creates',
    fullName: 'Carol White',
    avatarUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
    lastMessage: 'Sent a photo',
    timeString: '3h',
    isOnline: true,
    unreadCount: 0,
    lastMessageSentByMe: false,
  ),
  const Conversation(
    username: 'david_b',
    fullName: 'David Brown',
    avatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
    lastMessage: 'Seen',
    timeString: 'Yesterday',
    isOnline: false,
    unreadCount: 0,
    lastMessageSentByMe: true,
  ),
];

final List<ChatMessage> sampleChatMessages = [
  const ChatMessage(
    text: 'Hey! Did you see my latest post? 📸',
    type: MessageType.text,
    isSentByMe: false,
    timestamp: '4:15 PM',
  ),
  const ChatMessage(
    text: 'Yeah, it looked amazing! Where was that taken?',
    type: MessageType.text,
    isSentByMe: true,
    timestamp: '4:16 PM',
  ),
  const ChatMessage(
    imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
    type: MessageType.image,
    isSentByMe: false,
    timestamp: '4:17 PM',
  ),
  const ChatMessage(
    text: 'Right here! It\'s completely surreal.',
    type: MessageType.text,
    isSentByMe: false,
    timestamp: '4:17 PM',
  ),
  const ChatMessage(
    type: MessageType.heart,
    isSentByMe: true,
    timestamp: '4:18 PM',
    isSeen: true, // The iconic Instagram "Seen" receipt
  ),
];
