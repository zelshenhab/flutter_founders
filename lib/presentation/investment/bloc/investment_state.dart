import 'package:equatable/equatable.dart';
import '../models/investment_model.dart';

abstract class InvestmentState extends Equatable {
  const InvestmentState();

  @override
  List<Object?> get props => [];
}

class InvestmentInitial extends InvestmentState {}

class InvestmentLoading extends InvestmentState {}

class InvestmentLoaded extends InvestmentState {
  final List<InvestmentModel> investments;

  const InvestmentLoaded(this.investments);

  @override
  List<Object?> get props => [investments];
}

class InvestmentError extends InvestmentState {
  final String message;

  const InvestmentError(this.message);

  @override
  List<Object?> get props => [message];
}