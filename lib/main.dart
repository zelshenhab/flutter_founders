import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/auth/phone_input/bloc/phone_input_bloc.dart';
import 'package:flutter_founders/presentation/main_navigation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FoundersApp());
}

class FoundersApp extends StatelessWidget {
  const FoundersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => PhoneInputBloc())],
      child: MaterialApp(
        title: 'Founders App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(
          useMaterial3: true,
        ).copyWith(scaffoldBackgroundColor: Colors.black),
        home: const MainNavigationPage(),
      ),
    );
  }
}
