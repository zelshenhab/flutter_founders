import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/profile_model.dart';
import 'widgets/profile_header.dart';
import 'widgets/section_card.dart';
import 'widgets/partners_summary_button.dart';
import 'widgets/add_partner_button.dart';
import 'widgets/report_user_label.dart';

class OtherProfileScreen extends StatelessWidget {
  final ProfileModel profile;

  const OtherProfileScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              ProfileHeader(profile: profile),
              const SizedBox(height: 24),

              const PartnersSummaryButton(count: 21),
              const SizedBox(height: 16),

              Text(
                'О себе',
                style: GoogleFonts.inriaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              const SectionCard(
                content:
                    'Меня зовут Александр Монтгомери, я основатель и владелец компании "ScaleUp Solutions". Я начал свой путь в IT-сфере более 12 лет назад, работая над проектами в области цифровой трансформации. Сначала это был небольшой проект с командой единомышленников, но благодаря упорству и инновационным подходам мы выросли в компанию с десятками успешных кейсов.',
              ),

              const SizedBox(height: 12),

              Text(
                'О компании',
                style: GoogleFonts.inriaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              const SectionCard(
                content:
                    'ScaleUp Solutions — это крупнейшая инновационная компания, специализирующаяся на автоматизации бизнес-процессов, e-commerce решениях и развитии D2C-моделей. Мы помогаем предпринимателям и компаниям оптимизировать деятельность за счёт современных технологий.',
              ),

              const SizedBox(height: 24),

              const AddPartnerButton(),

              const SizedBox(height: 8),

              const ReportUserLabel(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
