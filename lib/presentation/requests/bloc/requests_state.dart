import 'package:equatable/equatable.dart';

class RequestsState extends Equatable {
  final List<RequestData> requests;
  final bool isLoading;

  const RequestsState({required this.requests, required this.isLoading});

  factory RequestsState.initial() {
    return const RequestsState(requests: [], isLoading: true);
  }

  RequestsState copyWith({List<RequestData>? requests, bool? isLoading}) {
    return RequestsState(
      requests: requests ?? this.requests,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [requests, isLoading];
}

class RequestData extends Equatable {
  final String name;
  final String company;
  final String description;
  final String time;
  final String badge;
  final List<String> tags;
  final String? avatarUrl;

  const RequestData({
    required this.name,
    required this.company,
    required this.description,
    required this.time,
    required this.badge,
    required this.tags,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [
    name,
    company,
    description,
    time,
    badge,
    tags,
    avatarUrl,
  ];
}
