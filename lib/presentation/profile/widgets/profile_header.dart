import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/profile/models/profile_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required ProfileModel profile});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16, top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.edit, color: Colors.white70, size: 24),
              SizedBox(width: 12),
              Icon(Icons.settings, color: Colors.white70, size: 24),
            ],
          ),
        ),

        const SizedBox(height: 12),

        const CircleAvatar(
          radius: 56,
          backgroundImage: AssetImage('assets/images/image 2.png'),
        ),

        const SizedBox(height: 12),

        Text(
          'Александр Монтгомери',
          style: GoogleFonts.inriaSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          'ScaleUp Solutions',
          style: GoogleFonts.inriaSans(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFAF925D),
          ),
        ),

        const SizedBox(height: 2),

        Text(
          'Цифровизация бизнеса',
          style: GoogleFonts.inriaSans(fontSize: 12, color: Colors.white70),
        ),
      ],
    );
  }
}
