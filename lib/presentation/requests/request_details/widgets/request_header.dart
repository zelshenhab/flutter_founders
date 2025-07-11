import 'package:flutter/material.dart';

class RequestHeader extends StatelessWidget {
  final String name;
  final String company;
  final String? avatarUrl;
  final String time;

  const RequestHeader({
    super.key,
    required this.name,
    required this.company,
    required this.time,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: avatarUrl != null ? AssetImage(avatarUrl!) : null,
          backgroundColor: Colors.white10,
          child: avatarUrl == null
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:
                MainAxisSize.min, 
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'InriaSans',
                ),
              ),
              Text(
                company,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFAF925D),
                  fontFamily: 'InriaSans',
                ),
              ),
            ],
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.white70, fontFamily: 'InriaSans'),
            ),
          ],
        ),
      ],
    );
  }
}
