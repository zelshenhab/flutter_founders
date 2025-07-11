import 'package:flutter/material.dart';

class InvestmentManagerInfo extends StatelessWidget {
  final String name;
  final String imageUrl; 
  final List<String> tags;

  const InvestmentManagerInfo({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Менеджер проекта',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'InriaSans',
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 26,
                backgroundImage: AssetImage('assets/images/image 1.png'),
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
                        fontFamily: 'InriaSans',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      children: tags
                          .map((tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Text(
                                  tag,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 12, fontFamily: 'InriaSans'),
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
