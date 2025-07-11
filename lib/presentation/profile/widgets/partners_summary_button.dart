import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartnersSummaryButton extends StatelessWidget {
  final int count;

  const PartnersSummaryButton({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Партнёры',
            style: GoogleFonts.inriaSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            '$count',
            style: GoogleFonts.inriaSans(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
