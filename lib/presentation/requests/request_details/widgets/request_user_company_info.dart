  import 'package:flutter/material.dart';
  import 'request_description_card.dart';

  class RequestUserCompanyInfo extends StatelessWidget {
    const RequestUserCompanyInfo({super.key});

    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Информация о пользователе',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontFamily: 'InriaSans'),
          ),
          SizedBox(height: 8),
          RequestDescriptionCard(
            description:
                'Меня зовут Итан Монтгомери, я основатель и владелец компании "ScaleUp Solutions". Я начал свой путь в IT-сфере более 12 лет назад, работая над проектами в области цифровой трансформации. Сейчас это был небольшой проект с командой единомышленников, но благодаря упорству и предпринимательскому подходу вывел компанию с десятками успешных кейсов.',
          ),
          SizedBox(height: 16),
          Text(
            'Информация о компании',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontFamily: 'InriaSans'),
          ),
          SizedBox(height: 8),
          RequestDescriptionCard(
            description:
                'ScaleUp Solutions — это крупнейшая инновационная компания, специализирующаяся на масштабировании бизнеса через e-commerce-решения и развитие D2C-моделей. Мы предлагаем стратегические и технологические решения для быстрого роста, снижения издержек и масштабирования за счёт современных технологических решений.',
          ),
        ],
      );
    }
  }
