import 'package:flutter/material.dart';

class DescriptionCard extends StatelessWidget {
  final String description;

  const DescriptionCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        description,
        style: const TextStyle(color: Colors.white70),
      ),
    );
  }
}
