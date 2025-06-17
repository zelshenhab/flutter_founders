import 'package:flutter/material.dart';

class RequestHeader extends StatelessWidget {
  const RequestHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar
        const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/image 2.png'),
        ),
        const SizedBox(width: 12),

        // Name, company, subtitle
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Александр Монтгомери',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                'ScaleUp Solutions',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFAF925D),
                ),
              ),
              Text(
                'Цифровизация бизнеса',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),

        // Date & time
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              '11.04',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 4),
            Text(
              '8:16 PM',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
