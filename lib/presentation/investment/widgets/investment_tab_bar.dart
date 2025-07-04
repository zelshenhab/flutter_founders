import 'package:flutter/material.dart';

class InvestmentTabBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  final TextEditingController controller;
  final VoidCallback onFilterTap;

  const InvestmentTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    required this.controller,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TabBar(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2, color: Colors.white),
            insets: EdgeInsets.symmetric(horizontal: 130),
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'InriaSans'),
          tabs: [
            Tab(text: 'Запросы'),
            Tab(text: 'Инвестиции'),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 79, 76, 76),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Color(0xFFE7E2E2)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            hintText: 'Поиск',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 236, 229, 229),
                            ),
                          ),
                          style: const TextStyle(color: Colors.white, fontFamily: 'InriaSans'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.tune, color: Colors.white),
                onPressed: onFilterTap,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
