class InvestmentModel {
  final String title;
  final String amount;
  final String period;
  final String location;
  final String tag;
  final int tagColor;

  final String description;
  final List<String> files;
  final String managerName;
  final String managerImage;
  final List<String> managerTags;

  InvestmentModel({
    required this.title,
    required this.amount,
    required this.period,
    required this.location,
    required this.tag,
    required this.tagColor,
    this.description = '',
    this.files = const [],
    this.managerName = '',
    this.managerImage = '',
    this.managerTags = const [],
  });
}
