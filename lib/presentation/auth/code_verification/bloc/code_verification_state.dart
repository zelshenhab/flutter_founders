import 'package:equatable/equatable.dart';

class CodeVerificationState extends Equatable {
  final String code;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const CodeVerificationState({
    required this.code,
    required this.isSubmitting,
    required this.isSuccess,
    this.errorMessage,
  });

  factory CodeVerificationState.initial() {
    return const CodeVerificationState(
      code: '',
      isSubmitting: false,
      isSuccess: false,
      errorMessage: null,
    );
  }

  CodeVerificationState copyWith({
    String? code,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return CodeVerificationState(
      code: code ?? this.code,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [code, isSubmitting, isSuccess, errorMessage];
}
