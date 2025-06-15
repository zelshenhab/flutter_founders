import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SharedAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      title: Text(
        'Founders',
        style: GoogleFonts.inriaSerif(
          fontSize: 38,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: const [
        Icon(Icons.edit_note, color: Colors.white, size: 38),
        SizedBox(width: 16),
        Icon(Icons.notifications_none, color: Colors.white, size: 38),
        SizedBox(width: 16),
      ],
    );
  }
}
