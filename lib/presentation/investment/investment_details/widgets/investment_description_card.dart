import 'package:flutter/material.dart';

class InvestmentDescriptionCard extends StatelessWidget {
  final String description;

  const InvestmentDescriptionCard({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Описание',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'InriaSans',
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            description,
            style: const TextStyle(
              color: Colors.white70,
              fontFamily: 'InriaSans',
              fontSize: 14,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
