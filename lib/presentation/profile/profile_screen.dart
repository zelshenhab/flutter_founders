import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/profile_header.dart';
import 'widgets/section_card.dart';
import 'widgets/partners_list.dart';
import 'models/profile_model.dart';
import 'models/partner_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const profile = ProfileModel(
      name: 'Александр Монтгомери',
      company: 'ScaleUp Solutions',
      subtitle: 'Цифровизация бизнеса',
      avatarUrl: 'assets/images/image 2.png',
    );

    final partners = [
      const PartnerModel(
        name: 'Артём Трегубов 🇷🇺',
        subtitle: 'Founders | В2В Разработка приложений',
        avatarUrl: 'assets/images/image 1.png',
      ),
      const PartnerModel(
        name: 'Уилл Тернер 🇺🇸🇪🇸',
        subtitle: 'Юриспруденция | Консалтинг',
        avatarUrl: 'assets/images/image 3.png',
      ),
      const PartnerModel(
        name: 'Фэнь Ли 🇨🇳',
        subtitle: 'Франшизы | Производство',
        avatarUrl: 'assets/images/image 4.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              const SizedBox(height: 12),

              // أيقونات settings/edit
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.settings, color: Colors.white70),
                    SizedBox(width: 16),
                    Icon(Icons.edit, color: Colors.white70),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // صورة + بيانات البروفايل
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage(profile.avatarUrl),
              ),
              const SizedBox(height: 12),
              Text(
                profile.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                profile.company,
                style: const TextStyle(
                  color: Color(0xFFAF925D),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                profile.subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),

              const SizedBox(height: 24),

              // О себе
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SectionCard(
                  title: 'О себе',
                  content:
                      'Меня зовут Александр Монтгомери, я основатель и владелец компании "ScaleUp Solutions". Я начал свой путь в IT-сфере более 12 лет назад, работая над проектами в области цифровой трансформации. Сначала это был небольшой проект с командой единомышленников, но благодаря упорству и инновационным подходам мы выросли в компанию с десятками успешных кейсов.',
                ),
              ),

              const SizedBox(height: 12),

              // О компании
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SectionCard(
                  title: 'О компании',
                  content:
                      'ScaleUp Solutions — это крупнейшая инновационная компания, специализирующаяся на автоматизации бизнес-процессов, e-commerce решениях и развитии D2C-моделей. Мы помогаем предпринимателям и компаниям оптимизировать деятельность за счёт современных технологий.',
                ),
              ),

              const SizedBox(height: 20),

              // Партнёры
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Партнёры',
                  style: GoogleFonts.inriaSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PartnersList(partners: partners),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
