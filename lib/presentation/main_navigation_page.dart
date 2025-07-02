import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/investment/bloc/investment_bloc.dart';
import 'package:flutter_founders/presentation/investment/bloc/investment_event.dart';
import 'package:flutter_founders/presentation/investment/create_investment/bloc/create_investment_bloc.dart';
import 'package:flutter_founders/presentation/investment/create_investment/create_investment_page.dart';
import 'package:flutter_founders/presentation/requests/bloc/requests_bloc.dart';
import 'package:flutter_founders/presentation/requests/bloc/requests_event.dart';
import 'package:flutter_founders/presentation/requests/create_request/create_request_page.dart';
import 'package:flutter_founders/presentation/shared_widgets/shared_app_bar.dart';
import 'home_tab_bar_page.dart'; // تحتوي على Запросы и Инвестиции

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;
  final ValueNotifier<int> _tabIndexNotifier = ValueNotifier(0); // shared notifier

  late final List<Widget> _pages = [
    HomeTabBarPage(tabIndexNotifier: _tabIndexNotifier),
    const Placeholder(),
    const Placeholder(),
    const Placeholder(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InvestmentBloc>(
          create: (_) => InvestmentBloc()..add(LoadInvestmentsEvent()),
        ),
        BlocProvider<RequestsBloc>(
          create: (_) => RequestsBloc()..add(LoadRequestsEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: SharedAppBar(
  onCreatePressed: () {
    if (_currentIndex == 0) {
      final tabIndex = _tabIndexNotifier.value;
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
    }
  },
),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
          ],
        ),
      ),
    );
  }
}
