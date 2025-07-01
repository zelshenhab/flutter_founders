import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'phone_input_event.dart';
import 'phone_input_state.dart';

class PhoneInputBloc extends Bloc<PhoneInputEvent, PhoneInputState> {
  PhoneInputBloc() : super(PhoneInputInitial()) {
    on<PhoneNumberChanged>((event, emit) {
      emit(PhoneInputInitial());
    });

    on<SubmitPhoneNumber>((event, emit) async {
      final phone = event.phoneNumber.trim();

      if (phone.isEmpty || phone.length < 10) {
        emit(PhoneInputFailure("رقم الهاتف غير صالح"));
        return;
      }

      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) {
          // ممكن تضيف تسجيل دخول تلقائي هنا لو حبيت
        },
        verificationFailed: (FirebaseAuthException e) {
          Future.microtask(() {
            add(
              PhoneNumberVerificationFailed(
                e.message ?? "فشل في إرسال الكود",
              ),
            );
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          Future.microtask(() {
            add(
              PhoneNumberCodeSent(
                phone,
                verificationId,
              ),
            );
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    });

    // لمعالجة الأحداث الداخلية بعد codeSent أو failure
    on<PhoneNumberVerificationFailed>((event, emit) {
      emit(PhoneInputFailure(event.message));
    });

    on<PhoneNumberCodeSent>((event, emit) {
      emit(PhoneSubmitSuccess(event.phoneNumber, event.verificationId));
    });
  }
}
