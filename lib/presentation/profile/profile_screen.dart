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
        name: 'Артём Трегубов 🇷🇺 🌍',
        company: 'Founders',
        subtitle: 'IT | B2B | Разработка приложений',
        avatarUrl: 'assets/images/image 1.png',
      ),
      const PartnerModel(
        name: 'Уилл Тернер 🇺🇸🇪🇸',
        company: 'Juris&Partners',
        subtitle: 'Юриспруденция | Консалтинг',
        avatarUrl: 'assets/images/image 3.png',
      ),
      const PartnerModel(
        name: 'Фэн Ли 🇯🇵',
        company: 'LifeHealth',
        subtitle: 'Фармацевтика | Производство',
        avatarUrl: 'assets/images/image 2.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ProfileHeader(profile: profile),
              ),
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFAF925D),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // TODO: show bottom sheet to add company
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          'Добавить компанию',
                          style: GoogleFonts.inriaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // "О себе"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'О себе',
                  style: GoogleFonts.inriaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF808080),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SectionCard(
                  content:
                      'Меня зовут Александр Монтгомери, я основатель и владелец компании "ScaleUp Solutions". Я начал свой путь в IT-сфере более 12 лет назад, работая над проектами в области цифровой трансформации. Сначала это был небольшой проект с командой единомышленников, но благодаря упорству и инновационным подходам мы выросли в компанию с десятками успешных кейсов.',
                ),
              ),

              const SizedBox(height: 2),

              // "О компании"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'О компании',
                  style: GoogleFonts.inriaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF808080),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SectionCard(
                  content:
                      'ScaleUp Solutions — это крупнейшая инновационная компания, специализирующаяся на автоматизации бизнес-процессов, e-commerce решениях и развитии D2C-моделей. Мы помогаем предпринимателям и компаниям оптимизировать деятельность за счёт современных технологий.',
                ),
              ),

              const SizedBox(height: 4),

              // Партнёры
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Партнёры',
                  style: GoogleFonts.inriaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF808080),
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
