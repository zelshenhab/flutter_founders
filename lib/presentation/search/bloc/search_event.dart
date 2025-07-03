import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class LoadProfiles extends SearchEvent {
  @override
  List<Object?> get props => [];
}

class SearchTextChanged extends SearchEvent {
  final String searchText;

  const SearchTextChanged(this.searchText);

  @override
  List<Object?> get props => [searchText];
}
