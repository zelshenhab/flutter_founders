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
      crossAxisAlignment: CrossAxisAlignment.center, // ← ده المهم
      children: [
        // Avatar
        CircleAvatar(
          radius: 45,
          backgroundImage: avatarUrl != null ? AssetImage(avatarUrl!) : null,
          backgroundColor: Colors.white10,
          child: avatarUrl == null
              ? const Icon(Icons.person, color: Colors.white)
              : null,
        ),
        const SizedBox(width: 12),

        // Name and company
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:
                MainAxisSize.min, // علشان الـ Column ما تاخدش ارتفاع زيادة
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                company,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFAF925D),
                ),
              ),
            ],
          ),
        ),

        // Time
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }
}
