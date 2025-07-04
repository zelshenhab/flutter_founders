class FilterModel {
  final List<String> selectedCountries;
  final List<String> selectedMainTags;
  final List<String> selectedSubTags;
  final bool isFoundersOnly;

  const FilterModel({
    required this.selectedCountries,
    required this.selectedMainTags,
    required this.selectedSubTags,
    required this.isFoundersOnly,
  });

  factory FilterModel.empty() {
    return const FilterModel(
      selectedCountries: [],
      selectedMainTags: [],
      selectedSubTags: [],
      isFoundersOnly: false,
    );
  }

  FilterModel copyWith({
    List<String>? selectedCountries,
    List<String>? selectedMainTags,
    List<String>? selectedSubTags,
    bool? isFoundersOnly,
  }) {
    return FilterModel(
      selectedCountries: selectedCountries ?? this.selectedCountries,
      selectedMainTags: selectedMainTags ?? this.selectedMainTags,
      selectedSubTags: selectedSubTags ?? this.selectedSubTags,
      isFoundersOnly: isFoundersOnly ?? this.isFoundersOnly,
    );
  }

  @override
  String toString() {
    return 'FilterModel(countries: $selectedCountries, tags: $selectedMainTags, subTags: $selectedSubTags, foundersOnly: $isFoundersOnly)';
  }
}
