import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/investment/bloc/investment_bloc.dart';
import 'package:flutter_founders/presentation/investment/bloc/investment_event.dart';
import 'package:flutter_founders/presentation/requests/bloc/requests_bloc.dart';
import 'package:flutter_founders/presentation/requests/bloc/requests_event.dart';
import 'package:flutter_founders/presentation/shared_widgets/shared_app_bar.dart';
import 'home_tab_bar_page.dart'; 

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}
// test github 
class _MainNavigationPageState extends State<MainNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeTabBarPage(),
    Placeholder(), // Search
    Placeholder(), // Chat
    Placeholder(), // Profile
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
        appBar: const SharedAppBar(),
        body: _pages[_currentIndex],
        bottomNavigationBar:  BottomNavigationBar(
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
