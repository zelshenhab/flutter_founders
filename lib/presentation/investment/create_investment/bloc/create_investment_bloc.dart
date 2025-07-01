import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_investment_event.dart';
import 'create_investment_state.dart';

class CreateInvestmentBloc extends Bloc<CreateInvestmentEvent, CreateInvestmentState> {
  CreateInvestmentBloc() : super(const CreateInvestmentState()) {
    on<UpdateTitle>((event, emit) => emit(state.copyWith(title: event.title)));
    on<UpdateDescription>((event, emit) => emit(state.copyWith(description: event.description)));
    on<UpdateAmount>((event, emit) => emit(state.copyWith(amount: event.amount)));
    on<UpdatePaybackPeriod>((event, emit) => emit(state.copyWith(period: event.period)));
    on<UpdateCountry>((event, emit) => emit(state.copyWith(country: event.country)));
    on<UpdateAdditional>((event, emit) => emit(state.copyWith(additional: event.additional)));
    on<UploadFile>(_onUploadFile);
    on<UpdateTextField>(_onUpdateTextField);
    on<SubmitInvestment>(_onSubmit);
  }

  void _onUploadFile(UploadFile event, Emitter<CreateInvestmentState> emit) {
    final updatedDocs = Map<String, File>.from(state.documents);
    updatedDocs[event.type] = event.file;
    emit(state.copyWith(documents: updatedDocs));
  }

  void _onUpdateTextField(UpdateTextField event, Emitter<CreateInvestmentState> emit) {
    switch (event.fieldKey) {
      case 'title':
        emit(state.copyWith(title: event.value));
        break;
      case 'description':
        emit(state.copyWith(description: event.value));
        break;
      case 'amount':
        emit(state.copyWith(amount: event.value));
        break;
      case 'period':
        emit(state.copyWith(period: event.value));
        break;
      case 'country':
        emit(state.copyWith(country: event.value));
        break;
      case 'additional':
        emit(state.copyWith(additional: event.value));
        break;
    }
  }

  FutureOr<void> _onSubmit(SubmitInvestment event, Emitter<CreateInvestmentState> emit) async {
    emit(state.copyWith(isSubmitting: true, isSuccess: false, isFailure: false));

    // Validate text fields
    final allFieldsFilled = state.title.trim().isNotEmpty &&
        state.description.trim().isNotEmpty &&
        state.amount.trim().isNotEmpty &&
        state.period.trim().isNotEmpty &&
        state.country.trim().isNotEmpty;

    // Validate that all 3 required docs are uploaded
    final allDocsUploaded = state.documents.containsKey('doc1') &&
        state.documents.containsKey('doc2') &&
        state.documents.containsKey('doc3');

    await Future.delayed(const Duration(seconds: 2)); // Simulate network/API delay

    if (allFieldsFilled && allDocsUploaded) {
      emit(state.copyWith(isSubmitting: false, isSuccess: true, isFailure: false));
    } else {
      emit(state.copyWith(isSubmitting: false, isSuccess: false, isFailure: true));
    }
  }
}
