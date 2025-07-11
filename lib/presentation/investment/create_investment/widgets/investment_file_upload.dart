import 'dart:io';
import 'package:flutter/material.dart';

class InvestmentFileUpload extends StatelessWidget {
  final String label;
  final File? file;
  final VoidCallback onUpload;

  const InvestmentFileUpload({
    super.key,
    required this.label,
    required this.file,
    required this.onUpload,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'InriaSans'),
          ),
          const SizedBox(height: 6),
          GestureDetector(
            onTap: onUpload,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                file != null ? file!.path.split("/").last : 'Добавить файл в формате PDF',
                style: TextStyle(
                  color: file != null ? Colors.white : Colors.white.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
