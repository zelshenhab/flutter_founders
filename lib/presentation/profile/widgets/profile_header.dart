import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // أيقونات التحكم
        Positioned(
          right: 0,
          child: Row(
            children: const [
              Icon(Icons.settings, color: Colors.white70, size: 20),
              SizedBox(width: 12),
              Icon(Icons.edit, color: Colors.white70, size: 20),
            ],
          ),
        ),

        // محتوى البروفايل
        Column(
          children: [
            const SizedBox(height: 8),
            // صورة البروفايل
            const CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage(
                'assets/images/avatar.jpg',
              ), // غيّر الصورة حسب الحاجة
            ),
            const SizedBox(height: 12),
            // الاسم
            Text(
              'Александр Монтгомери',
              style: GoogleFonts.inriaSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            // اسم الشركة
            Text(
              'ScaleUp Solutions',
              style: GoogleFonts.inriaSans(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFAF925D),
              ),
            ),
            const SizedBox(height: 2),
            // النص الفرعي
            Text(
              'Цифровизация бизнеса',
              style: GoogleFonts.inriaSans(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }
}
