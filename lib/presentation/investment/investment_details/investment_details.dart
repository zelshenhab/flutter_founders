// lib/presentation/investment/investment_details/investment_details.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/investment/models/details_investment_model.dart';
import 'bloc/investment_details_bloc.dart';
import 'bloc/investment_details_event.dart';
import 'bloc/investment_details_state.dart';
import 'widgets/investment_info_card.dart';
import 'widgets/investment_manager_card.dart';
import 'widgets/contact_button.dart';
import 'widgets/description_card.dart';

class InvestmentDetailsPage extends StatelessWidget {
  final DetailsInvestmentModel investment;

  const InvestmentDetailsPage({super.key, required this.investment});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          InvestmentDetailsBloc()..add(LoadInvestmentDetailsEvent(investment)),
      child: const _InvestmentDetailView(),
    );
  }
}

class _InvestmentDetailView extends StatelessWidget {
  const _InvestmentDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Инвестиция', style: TextStyle(color: Colors.white)),
      ),
      body: BlocBuilder<InvestmentDetailsBloc, InvestmentDetailsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final investment = state.investment!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  investment.title,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
                const SizedBox(height: 16),
                InvestmentInfoCard(investment: investment),
                const SizedBox(height: 24),
                InvestmentManagerCard(investment: investment),
                const SizedBox(height: 24),
                DescriptionCard(description: investment.description),
                const SizedBox(height: 24),
                const Center(child: ContactButton()),
              ],
            ),
          );
        },
      ),
    );
  }
}
