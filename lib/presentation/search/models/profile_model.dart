class ProfileModel {
  final String name;
  final String company;
  final String imageUrl;
  final List<String> tags;     // Main tags like 'IT', 'Услуги'
  final List<String>? subTags;  // Directly defined for each profile
  final String countryFlag;

  const ProfileModel({
    required this.name,
    required this.company,
    required this.imageUrl,
    required this.tags,
    this.subTags,
    required this.countryFlag,
  });
}
