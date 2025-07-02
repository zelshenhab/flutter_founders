// ✅ 3. phone_input_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../code_verification/code_verification_screen.dart';
import 'bloc/phone_input_bloc.dart';
import 'bloc/phone_input_event.dart';
import 'bloc/phone_input_state.dart';

class PhoneInputScreen extends StatelessWidget {
  PhoneInputScreen({super.key});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Founders',
                style: GoogleFonts.inriaSerif(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 80),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Введите\nномер телефона',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inriaSans(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Чтобы войти или стать участником сообщества',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inriaSans(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 40),
                    BlocBuilder<PhoneInputBloc, PhoneInputState>(
                      builder: (context, state) {
                        return TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            context.read<PhoneInputBloc>().add(
                              PhoneNumberChanged(value),
                            );
                          },
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '+7 (000) 000 00 00',
                            hintStyle: const TextStyle(color: Colors.white38),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 32, 32, 34),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 50),
                    BlocListener<PhoneInputBloc, PhoneInputState>(
                      listenWhen: (previous, current) =>
                          current is PhoneSubmitSuccess,
                      listener: (context, state) {
                        if (state is PhoneSubmitSuccess) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CodeVerificationScreen(
                                phoneNumber: state.phoneNumber,
                                verificationId: state.verificationId,
                              ),
                            ),
                          );
                        }
                      },
                      child: SizedBox(
                        width: 180,
                        child: ElevatedButton(
                          onPressed: () {
                            final phoneNumber = phoneController.text.trim();
                            context.read<PhoneInputBloc>().add(
                              SubmitPhoneNumber(phoneNumber),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[800],
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Продолжить',
                            style: GoogleFonts.inriaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
