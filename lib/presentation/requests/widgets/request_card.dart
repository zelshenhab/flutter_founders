import 'package:flutter/material.dart';

class RequestCard extends StatelessWidget {
  final String name;
  final String company;
  final String description;
  final String time;
  final String badge;
  final List<String> tags;
  final String? avatarUrl;
  final VoidCallback onTap;

  const RequestCard({
    super.key,
    required this.name,
    required this.company,
    required this.description,
    required this.time,
    required this.badge,
    required this.tags,
    this.avatarUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white10,
                  backgroundImage:
                      avatarUrl != null ? AssetImage(avatarUrl!) : null,
                  child: avatarUrl == null
                      ? const Icon(Icons.person, color: Colors.white)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: 'InriaSans',
                        ),
                      ),
                      Text(
                        company,
                        style: const TextStyle(
                          color: Color(0xFFAF925D),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'InriaSans',
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (badge.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: badge == "friend's request"
                              ? const Color(0xFF54804A)
                              : const Color(0xFF929292),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'InriaSans',
                          ),
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(description, style: const TextStyle(color: Colors.white, fontFamily: 'InriaSans')),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: tags
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12, fontFamily: 'InriaSans'),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}