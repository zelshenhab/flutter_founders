import 'package:flutter/material.dart';

class InvestmentDocumentsCard extends StatelessWidget {
  final List<String> files;

  const InvestmentDocumentsCard({super.key, required this.files});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Документы',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'InriaSans',
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: files
                .map((file) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        file,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12, fontFamily: 'InriaSans'),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
