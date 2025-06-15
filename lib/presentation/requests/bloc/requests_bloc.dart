import 'package:flutter_bloc/flutter_bloc.dart';
import 'requests_event.dart';
import 'requests_state.dart';

class RequestsBloc extends Bloc<RequestsEvent, RequestsState> {
  RequestsBloc() : super(RequestsState.initial()) {
    on<LoadRequestsEvent>(_onLoadRequests);
  }

  void _onLoadRequests(
    LoadRequestsEvent event,
    Emitter<RequestsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1));

    final dummyRequests = [
      const RequestData(
        name: 'Alexander Montgomery',
        company: 'GoldenFork',
        description:
            'Ищу надёжных поставщиков (товар/услуга) с возможностью долгосрочного сотрудничества.',
        time: '8:15 PM',
        badge: 'friend\'s request',
        tags: ['Restaurants', 'Supplies', 'Long-term', 'Product/service'],
        avatarUrl: 'assets/images/image 2.png',
      ),
      const RequestData(
        name: 'Daniel Pembrock',
        company: 'Terragroup Industries',
        description:
            'Требуется помощь в выходе на международный рынок. Интересуют юридические, логистические и маркетинговые аспекты.',
        time: '12:10 AM',
        badge: 'specialized request',
        tags: ['Medicine', 'Research', 'Logistics', 'Marketing'],
        avatarUrl: 'assets/images/image 3.png',
      ),
      const RequestData(
        name: 'Andrew Harrington',
        company: 'QuantumLink',
        description:
            'Требуется автоматизация рутинных процессов в компании. Интересует CRM-система.',
        time: '02:03',
        badge: '',
        tags: ['CRM', 'Automation', 'Long-term'],
        avatarUrl: 'assets/images/image 1.png',
      ),
    ];

    emit(state.copyWith(requests: dummyRequests, isLoading: false));
  }
}
