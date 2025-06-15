import 'package:equatable/equatable.dart';

abstract class RequestsEvent extends Equatable {
  const RequestsEvent();

  @override
  List<Object> get props => [];
}

class LoadRequestsEvent extends RequestsEvent {}
