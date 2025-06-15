// lib/presentation/investment/bloc/investment_event.dart
import 'package:equatable/equatable.dart';

abstract class InvestmentEvent extends Equatable {
  const InvestmentEvent();

  @override
  List<Object> get props => [];
}

class LoadInvestmentsEvent extends InvestmentEvent {}