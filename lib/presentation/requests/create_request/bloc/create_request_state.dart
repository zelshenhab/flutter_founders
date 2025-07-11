import 'package:equatable/equatable.dart';

class CreateRequestState extends Equatable {
  final String title;
  final String description;
  final List<String> selectedTags;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const CreateRequestState({
    required this.title,
    required this.description,
    required this.selectedTags,
    required this.isSubmitting,
    required this.isSuccess,
    required this.isFailure,
  });

  factory CreateRequestState.initial() {
    return const CreateRequestState(
      title: '',
      description: '',
      selectedTags: [],
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  CreateRequestState copyWith({
    String? title,
    String? description,
    List<String>? selectedTags,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return CreateRequestState(
      title: title ?? this.title,
      description: description ?? this.description,
      selectedTags: selectedTags ?? this.selectedTags,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object?> get props =>
      [title, description, selectedTags, isSubmitting, isSuccess, isFailure];
}
