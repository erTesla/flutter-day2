// screens/chat_screen.dart
// This is the THIRD screen – a simple chat conversation view.
//
// WHAT IT CONTAINS:
//   • An AppBar showing the contact's name
//   • A scrollable list of static chat messages
//   • Messages from "me" appear on the RIGHT in blue
//   • Messages from the other person appear on the LEFT in grey
//   • A text input field + Send button at the bottom (no functionality)

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final List<String> messages;

  const ChatScreen({
    super.key,
    required this.name,
    required this.messages,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {
  late List<String> chatMessages;
  final TextEditingController messageController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    chatMessages = List.from(widget.messages);
  }

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      setState(() {
        chatMessages.add(messageController.text.trim());
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius:
                          BorderRadius.circular(12),
                    ),
                    child: Text(
                      chatMessages[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Type a message",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}