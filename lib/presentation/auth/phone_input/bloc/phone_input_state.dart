import 'package:equatable/equatable.dart';

abstract class PhoneInputState extends Equatable {
  const PhoneInputState();

  @override
  List<Object?> get props => [];
}

class PhoneInputInitial extends PhoneInputState {
  const PhoneInputInitial();
}

class PhoneInputFailure extends PhoneInputState {
  final String message;
  const PhoneInputFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class PhoneSubmitSuccess extends PhoneInputState {
  final String phoneNumber;
  final String verificationId;

  const PhoneSubmitSuccess(this.phoneNumber, this.verificationId);

  @override
  List<Object> get props => [phoneNumber, verificationId];
}
