import 'package:equatable/equatable.dart';

abstract class CodeVerificationEvent extends Equatable {
  const CodeVerificationEvent();

  @override
  List<Object> get props => [];
}

class CodeChanged extends CodeVerificationEvent {
  final String code;
  const CodeChanged(this.code);

  @override
  List<Object> get props => [code];
}

class SubmitCode extends CodeVerificationEvent {
  final String verificationId;
  final String smsCode;

  const SubmitCode({required this.verificationId, required this.smsCode});

  @override
  List<Object> get props => [verificationId, smsCode];
}

class ResendCode extends CodeVerificationEvent {
  final String phoneNumber;
  const ResendCode(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}
