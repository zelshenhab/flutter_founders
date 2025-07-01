import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/resend_code_button.dart';
import 'bloc/code_verification_bloc.dart';
import 'bloc/code_verification_event.dart';
import 'bloc/code_verification_state.dart';
import '../waiting/waiting_screen.dart';

class CodeVerificationScreen extends StatelessWidget {
  final String phoneNumber;
  final String verificationId;

  const CodeVerificationScreen({
    super.key,
    required this.phoneNumber,
    required this.verificationId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CodeVerificationBloc(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: BlocConsumer<CodeVerificationBloc, CodeVerificationState>(
              listener: (context, state) {
                if (state.isSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const WaitingScreen()),
                  );
                } else if (state.errorMessage != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
                }
              },
              builder: (context, state) {
                return Column(
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
                    const SizedBox(height: 140),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Код отправлен на номер\n$phoneNumber',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inriaSans(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: 255,
                            child: TextField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(color: Colors.white),
                              onChanged: (value) {
                                context.read<CodeVerificationBloc>().add(
                                  CodeChanged(value),
                                );
                              },
                              decoration: InputDecoration(
                                hintText: 'СМС код',
                                hintStyle: const TextStyle(
                                  color: Colors.white38,
                                ),
                                filled: true,
                                fillColor: const Color.fromARGB(
                                  255,
                                  32,
                                  32,
                                  34,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 48),
                          SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: state.isSubmitting
                                  ? null
                                  : () {
                                      context.read<CodeVerificationBloc>().add(
                                        SubmitCode(
                                          smsCode: state.code,
                                          verificationId: verificationId,
                                        ),
                                      );
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[800],
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: state.isSubmitting
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    )
                                  : Text(
                                      'Подтвердить',
                                      style: GoogleFonts.inriaSans(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const ResendCodeButton(),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
