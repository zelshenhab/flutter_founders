// lib/presentation/profile/models/partner_model.dart
class PartnerModel {
  final String name;
  final String company; // ← مضاف جديد
  final String subtitle;
  final String avatarUrl;

  const PartnerModel({
    required this.name,
    required this.company,
    required this.subtitle,
    required this.avatarUrl,
  });
}
