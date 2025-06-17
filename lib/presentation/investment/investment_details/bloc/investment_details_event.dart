import 'package:flutter_founders/presentation/investment/models/details_investment_model.dart';

abstract class InvestmentDetailsEvent {}

class LoadInvestmentDetailsEvent extends InvestmentDetailsEvent {
  final DetailsInvestmentModel investment;

  LoadInvestmentDetailsEvent(this.investment);
}
