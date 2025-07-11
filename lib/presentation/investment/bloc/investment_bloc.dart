import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/investment_model.dart';
import 'investment_event.dart';
import 'investment_state.dart';

class InvestmentBloc extends Bloc<InvestmentEvent, InvestmentState> {
  InvestmentBloc() : super(InvestmentInitial()) {
    on<LoadInvestmentsEvent>(_onLoadInvestments);
    on<AddInvestmentEvent>(_onAddInvestment); 
  }

  Future<void> _onLoadInvestments(
    LoadInvestmentsEvent event,
    Emitter<InvestmentState> emit,
  ) async {
    emit(InvestmentLoading());
    await Future.delayed(const Duration(seconds: 1)); 

    try {
      final mockData = [
        InvestmentModel(
          title: 'Startup Marketplace',
          amount: '2 млн ₽',
          period: '18 месяцев',
          location: 'Россия',
          tag: 'Инвестиционный проект',
          tagColor: 0xFFE8D28F,
        ),
        InvestmentModel(
          title: 'Digital Health App',
          amount: '5 млн ₽',
          period: '24 месяца',
          location: 'Казахстан',
          tag: 'Продажа бизнеса',
          tagColor: 0xFFB1F2B3,
        ),
      ];
      emit(InvestmentLoaded(mockData));
    } catch (e) {
      emit(const InvestmentError('Ошибка загрузки инвестиций'));
    }
  }

  void _onAddInvestment(
    AddInvestmentEvent event,
    Emitter<InvestmentState> emit,
  ) {
    if (state is InvestmentLoaded) {
      final currentState = state as InvestmentLoaded;
      final updatedList = List<InvestmentModel>.from(currentState.investments)
        ..add(event.investment);
      emit(InvestmentLoaded(updatedList));
    }
  }
}
