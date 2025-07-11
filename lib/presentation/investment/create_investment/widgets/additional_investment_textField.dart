import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/investment/create_investment/bloc/create_investment_event.dart';
import '../bloc/create_investment_bloc.dart';
import '../bloc/create_investment_state.dart';

class AdditionalInvestmentTextField extends StatelessWidget {
  const AdditionalInvestmentTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateInvestmentBloc, CreateInvestmentState>(
      builder: (context, state) {
       final additionalText = state.additional;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Дополнительно',
                style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'InriaSans'),
              ),
              const SizedBox(height: 6),
              TextFormField(
                initialValue: additionalText,
                onChanged: (value) => context.read<CreateInvestmentBloc>().add(
                  UpdateTextField(fieldKey: 'additional', value: value),
                ),
                maxLines: 4,
                style: const TextStyle(color: Colors.white, fontFamily: 'InriaSans'),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade900,
                  hintText: 'Необязательное поле',
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.4), fontFamily: 'InriaSans'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
