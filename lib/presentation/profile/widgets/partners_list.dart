// lib/presentation/profile/widgets/partners_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/profile/models/partner_model.dart';

class PartnersList extends StatelessWidget {
  final List<PartnerModel> partners;

  const PartnersList({super.key, required this.partners});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Партнёры',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        ...partners.map((partner) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(partner.avatarUrl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        partner.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        partner.subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chat_bubble_outline, color: Colors.white70),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
