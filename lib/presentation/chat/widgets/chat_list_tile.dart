import 'package:flutter/material.dart';
import '../models/mock_chat_data.dart';

class ChatListTile extends StatelessWidget {
  final ChatContact contact;
  final VoidCallback onTap;

  const ChatListTile({super.key, required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: AssetImage(contact.avatar),
        radius: 24,
      ),
      title: Text(
        contact.name,
        style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'InriaSans'),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contact.company,
            style: const TextStyle(color: Colors.white70, fontSize: 13, fontFamily: 'InriaSans'),
          ),
          Text(
            contact.industry,
            style: const TextStyle(color: Colors.white38, fontSize: 12, fontFamily: 'InriaSans'),
          ),
        ],
      ),
    );
  }
}