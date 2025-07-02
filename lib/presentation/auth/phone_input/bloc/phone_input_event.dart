import 'package:equatable/equatable.dart';

abstract class PhoneInputEvent extends Equatable {
  const PhoneInputEvent();

  @override
  List<Object> get props => [];
}

// ✅ الحدث لما المستخدم يغيّر رقم الهاتف في الـ TextField
class PhoneNumberChanged extends PhoneInputEvent {
  final String phoneNumber;

  const PhoneNumberChanged(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

// ✅ الحدث لما يضغط المستخدم على زر "Продолжить"
class SubmitPhoneNumber extends PhoneInputEvent {
  final String phoneNumber;

  const SubmitPhoneNumber(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

// ✅ حدث داخلي: فشل إرسال الكود (يستخدم في Future.microtask)
class PhoneNumberVerificationFailed extends PhoneInputEvent {
  final String message;

  const PhoneNumberVerificationFailed(this.message);

  @override
  List<Object> get props => [message];
}

// ✅ حدث داخلي: تم إرسال الكود بنجاح (يستخدم في Future.microtask)
class PhoneNumberCodeSent extends PhoneInputEvent {
  final String phoneNumber;
  final String verificationId;

  const PhoneNumberCodeSent(this.phoneNumber, this.verificationId);

  @override
  List<Object> get props => [phoneNumber, verificationId];
}
