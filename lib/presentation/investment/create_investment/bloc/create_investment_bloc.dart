import 'dart:async';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'create_investment_event.dart';
import 'create_investment_state.dart';

class CreateInvestmentBloc extends Bloc<CreateInvestmentEvent, CreateInvestmentState> {
  CreateInvestmentBloc() : super(const CreateInvestmentState()) {
    on<UpdateTitle>((event, emit) =>
        emit(state.copyWith(title: event.title, isFailure: false, isSuccess: false)));

    on<UpdateDescription>((event, emit) =>
        emit(state.copyWith(description: event.description, isFailure: false, isSuccess: false)));

    on<UpdateAmount>((event, emit) =>
        emit(state.copyWith(amount: event.amount, isFailure: false, isSuccess: false)));

    on<UpdatePaybackPeriod>((event, emit) =>
        emit(state.copyWith(period: event.period, isFailure: false, isSuccess: false)));

    on<UpdateCountry>((event, emit) =>
        emit(state.copyWith(country: event.country, isFailure: false, isSuccess: false)));

    on<UpdateAdditional>((event, emit) =>
        emit(state.copyWith(additional: event.additional, isFailure: false, isSuccess: false)));

    on<UploadFile>(_onUploadFile);
    on<UpdateTextField>(_onUpdateTextField);
    on<SubmitInvestment>(_onSubmit);
  }

  void _onUploadFile(UploadFile event, Emitter<CreateInvestmentState> emit) {
    final updatedDocs = Map<String, File>.from(state.documents);
    updatedDocs[event.type] = event.file;
    emit(state.copyWith(
      documents: updatedDocs,
      isFailure: false,
      isSuccess: false,
    ));
  }

  void _onUpdateTextField(UpdateTextField event, Emitter<CreateInvestmentState> emit) {
    switch (event.fieldKey) {
      case 'title':
        emit(state.copyWith(title: event.value, isFailure: false, isSuccess: false));
        break;
      case 'description':
        emit(state.copyWith(description: event.value, isFailure: false, isSuccess: false));
        break;
      case 'amount':
        emit(state.copyWith(amount: event.value, isFailure: false, isSuccess: false));
        break;
      case 'period':
        emit(state.copyWith(period: event.value, isFailure: false, isSuccess: false));
        break;
      case 'country':
        emit(state.copyWith(country: event.value, isFailure: false, isSuccess: false));
        break;
      case 'additional':
        emit(state.copyWith(additional: event.value, isFailure: false, isSuccess: false));
        break;
    }
  }

  FutureOr<void> _onSubmit(SubmitInvestment event, Emitter<CreateInvestmentState> emit) async {
    emit(state.copyWith(isSubmitting: true, isFailure: false, isSuccess: false));

    // Validate fields
    final allFieldsFilled = state.title.trim().isNotEmpty &&
        state.description.trim().isNotEmpty &&
        state.amount.trim().isNotEmpty &&
        state.period.trim().isNotEmpty &&
        state.country.trim().isNotEmpty;

    final allDocsUploaded = state.documents.containsKey('doc1') &&
        state.documents.containsKey('doc2') &&
        state.documents.containsKey('doc3');

    await Future.delayed(const Duration(seconds: 1));

    if (allFieldsFilled && allDocsUploaded) {
      emit(state.copyWith(isSubmitting: false, isSuccess: true, isFailure: false));
    } else {
      emit(state.copyWith(isSubmitting: false, isSuccess: false, isFailure: true));
    }
  }
}
