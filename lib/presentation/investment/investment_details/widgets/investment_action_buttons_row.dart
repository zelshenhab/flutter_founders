import 'package:flutter/material.dart';

class InvestmentActionButtonsRow extends StatelessWidget {
  const InvestmentActionButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFAF925D),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Связаться нажата ✅')),
          );
        },
        child: const Text(
          'Связаться',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'InriaSans'),
        ),
      ),
    );
  }
}
