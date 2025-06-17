import 'package:equatable/equatable.dart';
import 'package:flutter_founders/presentation/investment/models/details_investment_model.dart';

class InvestmentDetailsState extends Equatable {
  final bool isLoading;
  final DetailsInvestmentModel? investment;

  const InvestmentDetailsState({
    required this.isLoading,
    this.investment,
  });

  factory InvestmentDetailsState.initial() {
    return const InvestmentDetailsState(isLoading: true);
  }

  InvestmentDetailsState copyWith({
    bool? isLoading,
    DetailsInvestmentModel? investment,
  }) {
    return InvestmentDetailsState(
      isLoading: isLoading ?? this.isLoading,
      investment: investment ?? this.investment,
    );
  }

  @override
  List<Object?> get props => [isLoading, investment ?? ''];
}
