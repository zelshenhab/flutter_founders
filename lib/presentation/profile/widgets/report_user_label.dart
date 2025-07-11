import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportUserLabel extends StatelessWidget {
  const ReportUserLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Пожаловаться на пользователя',
        style: GoogleFonts.inriaSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color.fromARGB(220, 255, 255, 255),
        ),
      ),
    );
  }
}
