import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/investment/create_investment/bloc/create_investment_bloc.dart';
import 'package:flutter_founders/presentation/investment/create_investment/bloc/create_investment_event.dart';
import 'package:flutter_founders/presentation/investment/create_investment/bloc/create_investment_state.dart';
import 'package:flutter_founders/presentation/investment/models/investment_model.dart';

class InvestmentSubmitButton extends StatelessWidget {
  const InvestmentSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateInvestmentBloc, CreateInvestmentState>(
      listener: (context, state) {
        if (state.isSuccess) {
          // Create InvestmentModel from user input
          final newInvestment = InvestmentModel(
            title: state.title,
            amount: state.amount,
            period: state.period,
            location: state.country,
            tag: 'Пользовательский проект',
            tagColor: 0xFFAF925D,
            description: state.description,
            files: [
              state.documents['doc1']?.path.split('/').last ?? 'Документ 1',
              state.documents['doc2']?.path.split('/').last ?? 'Документ 2',
              state.documents['doc3']?.path.split('/').last ?? 'Документ 3',
            ],
            managerName: 'Текущий пользователь',
            managerImage: 'https://via.placeholder.com/150',
            managerTags: ['Создатель', 'Инвестор'],
          );

          // Add to global list
          //context.read<InvestmentBloc>().add(AddInvestmentEvent(newInvestment));

          // Success feedback and navigate back
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Инвестиция отправлена на модерацию ✅'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (state.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Пожалуйста, заполните все поля ✏️'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state.isSubmitting;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    context.read<CreateInvestmentBloc>().add(SubmitInvestment());
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFAF925D),
              foregroundColor: Colors.white,
              minimumSize: const Size.fromHeight(50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                : const Text(
                    'Отправить на модерацию',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'InriaSans'),
                  ),
          ),
        );
      },
    );
  }
}
