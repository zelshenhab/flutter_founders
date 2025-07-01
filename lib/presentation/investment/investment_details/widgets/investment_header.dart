// lib/presentation/investment/investment_details/widgets/investment_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/investment/models/details_investment_model.dart';

class InvestmentHeader extends StatelessWidget {
  final DetailsInvestmentModel model;

  const InvestmentHeader({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Инвестиция',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Text(
          model.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _InvestmentInfoCard(model: model),
      ],
    );
  }
}

class _InvestmentInfoCard extends StatelessWidget {
  final DetailsInvestmentModel model;

  const _InvestmentInfoCard({required this.model});

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
          _InfoRow(label: 'Объём привлекаемых средств', value: model.amount),
          const SizedBox(height: 12),
          _InfoRow(label: 'Срок окупаемости', value: model.period),
          const SizedBox(height: 12),
          _InfoRow(label: 'Страна реализации', value: model.location),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.white),
        children: [
          TextSpan(
              text: '$label\n',
              style: const TextStyle(fontSize: 14, color: Colors.white70)),
          TextSpan(
              text: value,
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
