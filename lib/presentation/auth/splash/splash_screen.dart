// lib/presentation/auth/splash/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/auth/phone_input/bloc/phone_input_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../phone_input/phone_input_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => PhoneInputBloc(),
            child: PhoneInputScreen(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Время — деньги',
              style: GoogleFonts.inriaSans(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsetsGeometry.only(right: 32),
                child: Text(
                  'Бенджамин Франклин',
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
