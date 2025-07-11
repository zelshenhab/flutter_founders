import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_request_event.dart';
import 'create_request_state.dart';

class CreateRequestBloc extends Bloc<CreateRequestEvent, CreateRequestState> {
  CreateRequestBloc() : super(CreateRequestState.initial()) {
    on<TitleChanged>((event, emit) {
      emit(state.copyWith(title: event.title));
    });

    on<DescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<TagsChanged>((event, emit) {
      emit(state.copyWith(selectedTags: event.tags));
    });

    on<SubmitRequest>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, isSuccess: false, isFailure: false));

      await Future.delayed(const Duration(seconds: 1)); 

      if (state.title.isNotEmpty && state.description.isNotEmpty) {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: true,
          isFailure: false,
        ));
      } else {
        emit(state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          isFailure: true,
        ));
      }
    });
  }
}
