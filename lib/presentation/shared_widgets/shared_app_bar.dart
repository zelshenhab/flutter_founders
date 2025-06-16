import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/requests/create_request/create_request_page.dart';
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
      actions: [
        IconButton(
          icon: const Icon(Icons.edit_note, color: Colors.white, size: 38),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CreateRequestPage()),
            );
          },
        ),
        SizedBox(width: 16),
        Icon(Icons.notifications_none, color: Colors.white, size: 38),
        SizedBox(width: 16),
      ],
    );
  }
}
