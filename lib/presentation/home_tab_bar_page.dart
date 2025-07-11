import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/investment/investment_page.dart';
import 'package:flutter_founders/presentation/requests/requsets_page.dart';
import 'package:flutter_founders/presentation/requests/create_request/create_request_page.dart';
import 'package:flutter_founders/presentation/investment/create_investment/create_investment_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/investment/create_investment/bloc/create_investment_bloc.dart';
import 'package:flutter_founders/presentation/shared_widgets/shared_app_bar.dart';

class HomeTabBarPage extends StatelessWidget {
  final ValueNotifier<int> tabIndexNotifier;

  const HomeTabBarPage({super.key, required this.tabIndexNotifier});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Builder(
        builder: (context) {
          final TabController tabController = DefaultTabController.of(context);

          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              tabIndexNotifier.value = tabController.index;
            }
          });

          return Column(
            children: [
              SharedAppBar(
                onCreatePressed: () {
                  final tabIndex = tabIndexNotifier.value;
                  if (tabIndex == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateRequestPage()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider(
                          create: (_) => CreateInvestmentBloc(),
                          child: const CreateInvestmentPage(),
                        ),
                      ),
                    );
                  }
                },
              ),
              const TabBar(
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                  insets: EdgeInsets.symmetric(horizontal: 130),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(fontWeight: FontWeight.w600, fontFamily: 'InriaSans',),
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
                        height: 32,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 79, 76, 76),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search, color: Color(0xFFE7E2E2)),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Поиск',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 236, 229, 229)),
                                ),
                                style: TextStyle(color: Colors.white, fontFamily: 'InriaSans'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.tune,
                          color: Color.fromARGB(255, 236, 229, 229)),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    RequestsPage(),
                    InvestmentPage(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
