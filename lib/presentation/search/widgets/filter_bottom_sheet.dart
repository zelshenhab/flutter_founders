import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              // Sheet handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              const Text(
                'Фильтры',
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              // Mock dropdown
              const Text(
                'Выберите страну',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: 'Все',
                    items: const [
                      DropdownMenuItem(value: 'Все', child: Text('Все')),
                      DropdownMenuItem(value: '🇪🇺 Европа', child: Text('🇪🇺 Европа')),
                      DropdownMenuItem(value: '🌍 Мировой', child: Text('🌍 Мировой')),
                      DropdownMenuItem(value: '🇷🇺 Россия', child: Text('🇷🇺 Россия')),
                    ],
                    onChanged: (_) {},
                    dropdownColor: Colors.grey[900],
                    style: const TextStyle(color: Colors.white),
                    iconEnabledColor: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'Выберите интересы',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),

              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildTag('Разработка'),
                  _buildTag('Маркетинг'),
                  _buildTag('Юриспруденция'),
                  _buildTag('Консалтинг'),
                  _buildTag('ВЭД'),
                  _buildTag('ИТ'),
                ],
              ),

              const SizedBox(height: 32),

              // Apply button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Применить фильтр',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
    );
  }
}
