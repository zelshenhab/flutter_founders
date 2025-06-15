import 'package:flutter/material.dart';

class RequestFilterBar extends StatelessWidget {
  const RequestFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 2, color: Colors.white),
              insets: EdgeInsets.symmetric(
                horizontal: 130,
              ),  
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.w600),
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
                    child: const Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 231, 226, 226),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Поиск',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 236, 229, 229),
                              ),
                            ),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.tune, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
