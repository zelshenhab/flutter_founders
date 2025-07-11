import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddPartnerButton extends StatelessWidget {
  const AddPartnerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 300,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFAF925D),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Добавить в партнёры',
              style: GoogleFonts.inriaSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
