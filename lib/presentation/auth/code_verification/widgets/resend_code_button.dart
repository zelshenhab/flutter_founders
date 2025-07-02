// lib/presentation/auth/code_verification/widgets/resend_code_button.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          // TODO: implement resend logic
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 77, 76, 76),
          padding: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Запросить код\nещё раз',
          textAlign: TextAlign.center,
          style: GoogleFonts.inriaSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
