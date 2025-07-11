import 'package:flutter/material.dart';

class InvestmentTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final int minLines;
  final int maxLines;
  final String? initialValue;
  final Function(String) onChanged;

  const InvestmentTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.minLines = 1,
    this.maxLines = 1,
    this.initialValue,
    required this.onChanged,
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
          TextFormField(
            initialValue: initialValue,
            onChanged: onChanged,
            style: const TextStyle(color: Colors.white, fontFamily: 'InriaSans'),
            minLines: minLines,
            maxLines: maxLines,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade900,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontFamily: 'InriaSans'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
