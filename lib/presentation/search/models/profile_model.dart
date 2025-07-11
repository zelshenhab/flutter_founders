class ProfileModel {
  final String name;
  final String company;
  final String imageUrl;
  final List<String> tags;     
  final List<String>? subTags; 
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
