import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/chat/chat_list_page.dart';
import 'package:flutter_founders/presentation/investment/bloc/investment_bloc.dart';
import 'package:flutter_founders/presentation/investment/bloc/investment_event.dart';
import 'package:flutter_founders/presentation/profile/profile_screen.dart';
import 'package:flutter_founders/presentation/requests/bloc/requests_bloc.dart';
import 'package:flutter_founders/presentation/requests/bloc/requests_event.dart';
import 'package:flutter_founders/presentation/search/search_page.dart';
import 'home_tab_bar_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;
  final ValueNotifier<int> _tabIndexNotifier = ValueNotifier(0);

  late final List<Widget> _pages = [
    HomeTabBarPage(tabIndexNotifier: _tabIndexNotifier),
    const SearchPage(),
    const ChatListPage(),
    const ProfileScreen(),
  ];

  void _onTabTapped(int index) {
  setState(() {
    _currentIndex = index;

    if (index == 0) {
      _tabIndexNotifier.value = 0;
    }
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
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/pngs/home.png',
                width: 30,
                height: 30,
                color: _currentIndex == 0 ? Colors.white : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/pngs/search.png',
                width: 30,
                height: 30,
                color: _currentIndex == 1 ? Colors.white : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/pngs/chat.png',
                width: 30,
                height: 30,
                color: _currentIndex == 2 ? Colors.white : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/pngs/profile.png',
                width: 30,
                height: 30,
                color: _currentIndex == 3 ? Colors.white : Colors.grey,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
