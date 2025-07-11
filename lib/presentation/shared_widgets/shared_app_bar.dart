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
          onPressed: onCreatePressed,
          icon: Image.asset(
            'assets/pngs/create.png',
            width: 30,
            height: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 3),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Image.asset(
            'assets/pngs/notification.png',
            width: 30,
            height: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
