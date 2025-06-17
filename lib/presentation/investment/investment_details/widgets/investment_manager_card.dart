import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/investment/models/details_investment_model.dart';

class InvestmentManagerCard extends StatelessWidget {
  final DetailsInvestmentModel investment;

  const InvestmentManagerCard({super.key, required this.investment});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(investment.managerImage),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(investment.managerName, style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 4),
              Wrap(
                spacing: 6,
                children: investment.managerTags
                    .map((tag) => Chip(
                          label: Text(tag),
                          backgroundColor: Colors.grey[700],
                          labelStyle: const TextStyle(color: Colors.white),
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
