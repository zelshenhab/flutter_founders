import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/search/mock/mock_profiles.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<LoadProfiles>((event, emit) {
      emit(SearchLoading());
      emit(SearchLoaded(mockProfiles));
    });

    on<SearchTextChanged>((event, emit) {
      final query = event.searchText.toLowerCase();

      final filtered = mockProfiles.where((profile) {
        return profile.name.toLowerCase().contains(query) ||
               profile.company.toLowerCase().contains(query) ||
               profile.tags.any((tag) => tag.toLowerCase().contains(query));
      }).toList();

      emit(SearchLoaded(filtered));
    });
  }
}
