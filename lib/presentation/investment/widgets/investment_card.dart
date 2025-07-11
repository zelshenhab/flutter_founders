import 'package:flutter/material.dart';

class InvestmentCard extends StatelessWidget {
  final String title;
  final String amount;
  final String period;
  final String location;
  final String tag;
  final Color tagColor;
  final VoidCallback onTap;

  const InvestmentCard({
    super.key,
    required this.title,
    required this.amount,
    required this.period,
    required this.location,
    required this.tag,
    required this.tagColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 50,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2E), 
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'InriaSans',
                ),
              ),
              const SizedBox(height: 12),

              // Info rows
              _buildInfoRow('Объём привлекаемых средств', amount),
              _buildInfoRow('Срок окупаемости', period),
              _buildInfoRow('Страна реализации', location),

              const SizedBox(height: 12),

              // Tag Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: tagColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tag,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.white60, fontSize: 13, fontFamily: 'InriaSans',)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 13, fontFamily: 'InriaSans',)),
        ],
      ),
    );
  }
}
