import 'package:equatable/equatable.dart';
import '../models/profile_model.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object?> get props => [];
}

class SearchLoaded extends SearchState {
  final List<ProfileModel> profiles;

  const SearchLoaded(this.profiles);

  @override
  List<Object?> get props => [profiles];
}

class SearchError extends SearchState {
  final String message;

  const SearchError(this.message);

  @override
  List<Object?> get props => [message];
}
