class Conversation {
  final String name;
  final String avatarLetter;
  final String lastMessage;

  Conversation({
    required this.name,
    required this.avatarLetter,
    required this.lastMessage,
  });
}

enum MessageStatus { sending, sent, delivered, read }

class ChatMessage {
  final String id;
  String text;
  bool isSentByMe;
  DateTime timestamp;
  MessageStatus status;
  String? reaction; // simple emoji
  String? replyToId;

  ChatMessage({
    required this.id,
    required this.text,
    required this.isSentByMe,
    DateTime? timestamp,
    this.status = MessageStatus.sent,
    this.reaction,
    this.replyToId,
  }) : timestamp = timestamp ?? DateTime.now();
}

final List<Conversation> sampleConversations = [
  Conversation(
    name: 'alice',
    avatarLetter: 'A',
    lastMessage: 'Beautiful sunset today',
  ),
  Conversation(
    name: 'bob',
    avatarLetter: 'B',
    lastMessage: 'Learning Flutter is fun',
  ),
  Conversation(
    name: 'carol',
    avatarLetter: 'C',
    lastMessage: 'Weekend vibes',
  ),
  Conversation(
    name: 'david',
    avatarLetter: 'D',
    lastMessage: 'Coffee and coding',
  ),
  Conversation(
    name: 'eva',
    avatarLetter: 'E',
    lastMessage: 'Exploring new places',
  ),
];

List<ChatMessage> sampleChatMessages = [
  ChatMessage(id: 'm1', text: 'Hey, are you free later today?', isSentByMe: false, timestamp: DateTime.now().subtract(const Duration(minutes: 65))),
  ChatMessage(id: 'm2', text: 'Yes, I should be available after 5.', isSentByMe: true, timestamp: DateTime.now().subtract(const Duration(minutes: 60)), status: MessageStatus.read),
  ChatMessage(id: 'm3', text: 'Perfect. Want to grab coffee?', isSentByMe: false, timestamp: DateTime.now().subtract(const Duration(minutes: 58))),
  ChatMessage(id: 'm4', text: 'That works for me.', isSentByMe: true, timestamp: DateTime.now().subtract(const Duration(minutes: 55)), status: MessageStatus.delivered),
  ChatMessage(id: 'm5', text: 'See you then!', isSentByMe: false, timestamp: DateTime.now().subtract(const Duration(minutes: 50))),
];