import 'dart:io';
import 'package:equatable/equatable.dart';

class CreateInvestmentState extends Equatable {
  final String title;
  final String description;
  final String amount;
  final String period;
  final String country;
  final Map<String, File> documents;
  final String additional;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const CreateInvestmentState({
    this.title = '',
    this.description = '',
    this.amount = '',
    this.period = '',
    this.country = '',
    this.documents = const {},
    this.additional = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  CreateInvestmentState copyWith({
    String? title,
    String? description,
    String? amount,
    String? period,
    String? country,
    Map<String, File>? documents,
    String? additional,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return CreateInvestmentState(
      title: title ?? this.title,
      description: description ?? this.description,
      amount: amount ?? this.amount,
      period: period ?? this.period,
      country: country ?? this.country,
      documents: documents ?? this.documents,
      additional: additional ?? this.additional,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props => [
    title,
    description,
    amount,
    period,
    country,
    documents,
    additional,
    isSubmitting,
    isSuccess,
    isFailure
  ];
}
