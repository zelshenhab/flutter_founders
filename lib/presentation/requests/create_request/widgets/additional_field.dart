import 'package:flutter/material.dart';

class AdditionalField extends StatelessWidget {
  const AdditionalField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Дополнительно',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            fontFamily: 'InriaSans',
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          style: const TextStyle(color: Colors.white, fontFamily: 'InriaSans'),
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Необязательное поле',
            hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'InriaSans'),
            filled: true,
            fillColor: const Color.fromARGB(255, 40, 40, 42),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
