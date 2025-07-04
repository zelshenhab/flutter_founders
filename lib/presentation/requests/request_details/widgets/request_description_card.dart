import 'package:flutter/material.dart';

class RequestDescriptionCard extends StatelessWidget {
  final String description;

  const RequestDescriptionCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        description,
        style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.4, fontFamily: 'InriaSans'),
      ),
    );
  }
}
