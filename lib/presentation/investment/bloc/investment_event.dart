// lib/presentation/investment/bloc/investment_event.dart

import '../models/investment_model.dart';

abstract class InvestmentEvent {
  const InvestmentEvent();
}

class LoadInvestmentsEvent extends InvestmentEvent {
  const LoadInvestmentsEvent();
}

class AddInvestmentEvent extends InvestmentEvent {
  final InvestmentModel investment;
  const AddInvestmentEvent(this.investment);
}
