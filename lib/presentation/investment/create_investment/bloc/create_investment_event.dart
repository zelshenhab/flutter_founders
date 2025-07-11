import 'package:equatable/equatable.dart';
import 'dart:io';

abstract class CreateInvestmentEvent extends Equatable {
  const CreateInvestmentEvent();

  @override
  List<Object?> get props => [];
}

class UpdateTitle extends CreateInvestmentEvent {
  final String title;
  const UpdateTitle(this.title);

  @override
  List<Object?> get props => [title];
}

class UpdateDescription extends CreateInvestmentEvent {
  final String description;
  const UpdateDescription(this.description);

  @override
  List<Object?> get props => [description];
}

class UpdateAmount extends CreateInvestmentEvent {
  final String amount;
  const UpdateAmount(this.amount);

  @override
  List<Object?> get props => [amount];
}

class UpdatePaybackPeriod extends CreateInvestmentEvent {
  final String period;
  const UpdatePaybackPeriod(this.period);

  @override
  List<Object?> get props => [period];
}

class UpdateCountry extends CreateInvestmentEvent {
  final String country;
  const UpdateCountry(this.country);

  @override
  List<Object?> get props => [country];
}

class UploadFile extends CreateInvestmentEvent {
  final String type;
  final File file;
  const UploadFile({required this.type, required this.file});

  @override
  List<Object?> get props => [type, file];
}

class UpdateAdditional extends CreateInvestmentEvent {
  final String additional;
  const UpdateAdditional(this.additional);

  @override
  List<Object?> get props => [additional];
}

class SubmitInvestment extends CreateInvestmentEvent {}

class UpdateTextField extends CreateInvestmentEvent {
  final String fieldKey;
  final String value;

  const UpdateTextField({required this.fieldKey, required this.value});

  @override
  List<Object?> get props => [fieldKey, value];
}
