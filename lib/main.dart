import 'package:flutter/material.dart';

import 'presentation/main_navigation_page.dart';

void main() {
  runApp(const FoundersApp());
}

class FoundersApp extends StatelessWidget {
  const FoundersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Founders App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const MainNavigationPage(),
    );
  }
}
