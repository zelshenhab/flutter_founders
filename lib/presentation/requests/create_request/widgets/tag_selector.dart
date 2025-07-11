import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/create_request_bloc.dart';
import '../bloc/create_request_event.dart';
import '../bloc/create_request_state.dart';

class TagSelector extends StatelessWidget {
  const TagSelector({super.key, required List availableTags});

  @override
  Widget build(BuildContext context) {
    final tags = [
      'Маркетинг',
      'Автоматизация',
      'Поставки',
      'Развитие',
      'Управление',
      'IT',
      'Эффективность',
      'Ценность',
      'ROI',
      'Long-term',
      'Цифровизация',
      'Логистика',
      'Капитал',
      'Рост',
      'Инвестор',
      'Синергия',
    ];

    return BlocBuilder<CreateRequestBloc, CreateRequestState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Теги',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'InriaSans', 
              ),
            ),
            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 40, 42),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.grey, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Поиск по тегам',
                          style: TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'InriaSans'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tags.map((tag) {
                      final isSelected = state.selectedTags.contains(tag);
                      return GestureDetector(
                        onTap: () {
                          final updated = List<String>.from(state.selectedTags);
                          isSelected ? updated.remove(tag) : updated.add(tag);
                          context.read<CreateRequestBloc>().add(
                            TagsChanged(updated),
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.grey[400]
                                : Colors.grey[700],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'InriaSans',
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
