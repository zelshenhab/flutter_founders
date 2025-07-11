import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import '../models/mock_chat_data.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<LoadChatList>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(ChatListLoaded(mockContacts));
    });
  }
}