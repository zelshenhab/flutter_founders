// lib/presentation/investment/models/investment_model.dart
class InvestmentModel {
  final String title;
  final String amount;
  final String period;
  final String location;
  final String tag;
  final int tagColor;

  InvestmentModel({
    required this.title,
    required this.amount,
    required this.period,
    required this.location,
    required this.tag,
    required this.tagColor,
  });
}