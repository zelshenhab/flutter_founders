import 'package:flutter/material.dart';
import '../models/mock_chat_data.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatContact contact;
  const ChatAppBar({super.key, required this.contact});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2D2D2D),
      padding: const EdgeInsets.only(top: 8),
      child: AppBar(
      backgroundColor: const Color(0xFF2D2D2D),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                contact.name,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'InriaSans'),
              ),
              Text(
                contact.lastSeen,
                style: const TextStyle(color: Colors.white70, fontSize: 12, fontFamily: 'InriaSans'),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: CircleAvatar(
            backgroundImage: AssetImage(contact.avatar),
            radius: 18,
          ),
        ),
      ],
          ),
    );
  }
}
