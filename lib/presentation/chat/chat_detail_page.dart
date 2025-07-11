import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/chat/widgets/chat_app_bar.dart.dart';
import 'models/mock_chat_data.dart';
import 'widgets/chat_message_bubble.dart';
import 'widgets/chat_input_field.dart';

class ChatDetailPage extends StatelessWidget {
  final ChatContact contact;
  const ChatDetailPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: ChatAppBar(contact: contact),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text(
            '5 мая',
            style: TextStyle(color: Colors.white38, fontFamily: 'InriaSans'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: mockMessages.length,
              itemBuilder: (context, index) {
                return ChatMessageBubble(message: mockMessages[index]);
              },
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}