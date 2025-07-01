import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'code_verification_event.dart';
import 'code_verification_state.dart';

class CodeVerificationBloc
    extends Bloc<CodeVerificationEvent, CodeVerificationState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  CodeVerificationBloc() : super(CodeVerificationState.initial()) {
    on<CodeChanged>((event, emit) {
      emit(state.copyWith(code: event.code, errorMessage: null));
    });

    on<SubmitCode>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, errorMessage: null));

      try {
        final credential = PhoneAuthProvider.credential(
          verificationId: event.verificationId,
          smsCode: event.smsCode,
        );

        await _firebaseAuth.signInWithCredential(credential);

        if (emit.isDone) return;
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } on FirebaseAuthException catch (_) {
        if (emit.isDone) return;
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: 'كود غير صحيح أو منتهي الصلاحية',
          ),
        );
      } catch (_) {
        if (emit.isDone) return;
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: 'حدث خطأ أثناء التحقق',
          ),
        );
      }
    });

    on<ResendCode>((event, emit) async {
      // تقدر تضيف منطق إعادة إرسال الكود لاحقًا
    });
  }
}
