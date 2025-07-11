import 'package:flutter/material.dart';
import '../models/profile_model.dart';

class ProfileCard extends StatelessWidget {
  final ProfileModel profile;

  const ProfileCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 26,
            backgroundImage: NetworkImage(profile.imageUrl),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${profile.name} ${profile.countryFlag}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'InriaSans',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),

                Text(
                  profile.company,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'InriaSans',
                  ),
                ),
                const SizedBox(height: 8),

                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: profile.tags.map((tag) {
                    final color = _getTagColor(tag);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 10),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontFamily: 'InriaSans',
                        ),
                      ),
                    );
                  }).toList(),
                ),

                if (profile.subTags != null && profile.subTags!.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: profile.subTags!.map((subTag) {
                      final color = _getSubTagColor(subTag);
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          subTag,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'InriaSans',
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getTagColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'it':
        return Colors.blueAccent;
      case 'маркетинг':
        return Colors.redAccent;
      case 'бизнес модели':
        return Colors.deepPurple;
      case 'недвижимость':
        return Colors.brown;
      case 'финансы':
        return Colors.green;
      case 'медиа':
        return Colors.orange;
      case 'консалтинг':
        return Colors.teal;
      case 'здравоохранение':
        return Colors.pink;
      case 'логистика':
        return Colors.amber;
      case 'юриспруденция':
        return Colors.indigo;
      case 'образование':
        return Colors.lightBlueAccent;
      case 'услуги':
        return Colors.cyan;
      case 'производство':
        return Colors.grey;
      case 'вэд':
        return Colors.deepOrangeAccent;
      default:
        return Colors.grey.shade800;
    }
  }

  Color _getSubTagColor(String subTag) {
    final lower = subTag.toLowerCase();

    if (lower == 'frontend') return Colors.blueAccent;
    if (lower == 'backend') return Colors.lightBlueAccent;
    if (lower == 'qa') return Colors.green;
    if (lower == 'devops') return Colors.teal;

    if (lower == 'seo') return Colors.redAccent;
    if (lower == 'реклама') return Colors.deepOrange;
    if (lower == 'брендинг') return Colors.purpleAccent;
    if (lower == 'pr') return Colors.red;

    if (lower == 'b2b') return Colors.deepPurple;
    if (lower == 'b2c') return Colors.indigo;
    if (lower == 'saas') return Colors.lightGreen;
    if (lower == 'franchising') return Colors.cyan;

    if (lower == 'продажа') return Colors.green;
    if (lower == 'аренда') return Colors.brown;
    if (lower == 'коммерческая') return Colors.grey;
    if (lower == 'жилая') return Colors.orange;

    if (lower == 'инвестиции') return Colors.greenAccent;
    if (lower == 'аудит') return Colors.tealAccent;
    if (lower == 'бухгалтерия') return Colors.blueGrey;
    if (lower == 'крипто') return Colors.deepOrange;

    if (lower == 'фото') return Colors.purple;
    if (lower == 'видео') return Colors.redAccent;
    if (lower == 'анимация') return Colors.yellow;
    if (lower == 'соцсети') return Colors.lightBlue;

    if (lower == 'hr') return Colors.lime;
    if (lower == 'стратегия') return Colors.deepOrangeAccent;
    if (lower == 'юр. консалтинг') return Colors.indigoAccent;

    if (lower == 'массаж') return Colors.pinkAccent;
    if (lower == 'терапия') return Colors.redAccent;
    if (lower == 'диагностика') return Colors.cyanAccent;
    if (lower == 'реабилитация') return Colors.blueAccent;

    if (lower == 'доставка') return Colors.amber;
    if (lower == 'склад') return Colors.grey;
    if (lower == 'таможня') return Colors.brown;
    if (lower == 'курьер') return Colors.yellowAccent;

    if (lower == 'договоры') return Colors.indigo;
    if (lower == 'судебное') return Colors.deepPurpleAccent;
    if (lower == 'интел. собственность') return Colors.orangeAccent;
    if (lower == 'лицензии') return Colors.green;

    if (lower == 'онлайн-курсы') return Colors.lightGreenAccent;
    if (lower == 'тренинги') return Colors.cyan;
    if (lower == 'школы') return Colors.orangeAccent;
    if (lower == 'репетиторство') return Colors.deepPurple;

    if (lower == 'маникюр') return Colors.pink;
    if (lower == 'педикюр') return Colors.redAccent;
    if (lower == 'доставка документов') return Colors.amber;
    if (lower == 'груминг') return Colors.brown;

    if (lower == 'сборка') return Colors.grey;
    if (lower == 'упаковка') return Colors.blueGrey;
    if (lower == 'контроль качества') return Colors.greenAccent;
    if (lower == 'техподдержка') return Colors.cyanAccent;

    if (lower == 'импорт') return Colors.deepPurple;
    if (lower == 'экспорт') return Colors.deepOrangeAccent;
    if (lower == 'сертификация') return Colors.indigo;
    if (lower == 'контракты') return Colors.green;

    return Colors.grey.shade700; // Fallback for unknown sub-tags
  }
}
