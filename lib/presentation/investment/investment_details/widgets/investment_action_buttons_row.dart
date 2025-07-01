// lib/presentation/investment/investment_details/widgets/investment_action_buttons_row.dart
import 'package:flutter/material.dart';

class InvestmentActionButtonsRow extends StatelessWidget {
  const InvestmentActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _IconButton(icon: Icons.favorite_border),
        const SizedBox(width: 12),
        const _IconButton(icon: Icons.bookmark_border),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD9B65C),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
          ),
          onPressed: () {
            // Contact action
          },
          child: const Text(
            'Связаться',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;

  const _IconButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}