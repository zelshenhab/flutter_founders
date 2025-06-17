// lib/presentation/investment/create_investment/bloc/create_investment_bloc.dart
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
    on<UploadFile>((event, emit) {
      final updatedDocs = Map<String, File>.from(state.documents);
      updatedDocs[event.type] = event.file;
      emit(state.copyWith(documents: updatedDocs));
    });
    on<UpdateTextField>(_onUpdateTextField);
    on<SubmitInvestment>(_onSubmit);
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
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(isSubmitting: false, isSuccess: true));
  }
}
