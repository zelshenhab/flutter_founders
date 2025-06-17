import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  const ContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // TODO: implement contact action
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFC4A46B),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      child: const Text('Связаться'),
    );
  }
}
