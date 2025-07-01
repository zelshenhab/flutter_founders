import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SharedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onCreatePressed;

  const SharedAppBar({super.key, required this.onCreatePressed});

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
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_note, color: Colors.white, size: 38),
          onPressed: onCreatePressed,
        ),
        const SizedBox(width: 16),
        const Icon(Icons.notifications_none, color: Colors.white, size: 38),
        const SizedBox(width: 16),
      ],
    );
  }
}
