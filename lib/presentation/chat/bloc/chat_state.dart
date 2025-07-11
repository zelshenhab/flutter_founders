import '../models/mock_chat_data.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatListLoaded extends ChatState {
  final List<ChatContact> contacts;
  ChatListLoaded(this.contacts);
}
