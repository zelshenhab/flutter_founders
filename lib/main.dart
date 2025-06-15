import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/main_navigation_page.dart';
import 'presentation/requests/bloc/requests_bloc.dart';
import 'presentation/requests/bloc/requests_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Requests App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: BlocProvider(
        create: (_) => RequestsBloc()..add(LoadRequestsEvent()),
        child: const MainNavigationPage(),
      ),
    );
  }
}
