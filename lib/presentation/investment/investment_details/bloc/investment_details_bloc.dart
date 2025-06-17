import 'package:flutter_bloc/flutter_bloc.dart';
import 'investment_details_event.dart';
import 'investment_details_state.dart';

class InvestmentDetailsBloc extends Bloc<InvestmentDetailsEvent, InvestmentDetailsState> {
  InvestmentDetailsBloc() : super(InvestmentDetailsState.initial()) {
    on<LoadInvestmentDetailsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      await Future.delayed(const Duration(milliseconds: 500)); // simulate fetch
      emit(state.copyWith(
        isLoading: false,
        investment: event.investment,
      ));
    });
  }
}
