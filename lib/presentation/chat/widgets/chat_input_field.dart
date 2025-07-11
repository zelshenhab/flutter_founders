import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();
  final List<File> _attachments = [];

  Future<void> _pickAttachment() async {
    if (_attachments.length >= 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Максимум 5 вложений')),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo, color: Colors.white),
            title: const Text('Галерея', style: TextStyle(color: Colors.white, fontFamily: 'InriaSans')),
            onTap: () async {
              final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (picked != null) {
                setState(() => _attachments.add(File(picked.path)));
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt, color: Colors.white),
            title: const Text('Камера', style: TextStyle(color: Colors.white, fontFamily: 'InriaSans')),
            onTap: () async {
              final picked = await ImagePicker().pickImage(source: ImageSource.camera);
              if (picked != null) {
                setState(() => _attachments.add(File(picked.path)));
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.insert_drive_file, color: Colors.white),
            title: const Text('Файлы', style: TextStyle(color: Colors.white, fontFamily: 'InriaSans')),
            onTap: () async {
              final result = await FilePicker.platform.pickFiles();
              if (result != null && result.files.single.path != null) {
                setState(() => _attachments.add(File(result.files.single.path!)));
              }
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isEmpty && _attachments.isEmpty) return;

    debugPrint('Sending message: "$message"');
    debugPrint('Attachments count: ${_attachments.length}');

    _controller.clear();
    setState(() => _attachments.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 35, left: 19, right: 5, top: 12),
      color: const Color(0xFF2D2D2D),
      child: Row(
        children: [
          GestureDetector(
            onTap: _pickAttachment,
            child: Image.asset(
              'assets/pngs/attach.png',
              width: 24,
              height: 24,
              color: Colors.grey,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 278,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(19),
            ),
            child: TextField(
              controller: _controller,
              style: const TextStyle(color: Colors.white, fontFamily: 'InriaSans'),
              decoration: const InputDecoration(
                hintText: 'Сообщение...',
                hintStyle: TextStyle(color: Colors.white38, fontFamily: 'InriaSans'),
                contentPadding: EdgeInsets.only(bottom: 10, top: 5, left: 10),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _sendMessage,
            child: SvgPicture.asset(
              'assets/icons/send.svg',
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}
