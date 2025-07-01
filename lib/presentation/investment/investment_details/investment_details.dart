// lib/presentation/investment/investment_details/investment_details_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/investment/models/details_investment_model.dart';
import 'widgets/investment_header.dart';
import 'widgets/investment_documents_card.dart';
import 'widgets/investment_manager_info.dart';
import 'widgets/investment_description_card.dart';
import 'widgets/investment_action_buttons_row.dart';

class InvestmentDetailsPage extends StatelessWidget {
  final DetailsInvestmentModel investment;

  const InvestmentDetailsPage({super.key, required this.investment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InvestmentHeader(model: investment),
              const SizedBox(height: 16),
              InvestmentDocumentsCard(files: investment.files),
              const SizedBox(height: 16),
              InvestmentManagerInfo(
                name: investment.managerName,
                imageUrl: investment.managerImage,
                tags: investment.managerTags,
              ),
              const SizedBox(height: 16),
              InvestmentDescriptionCard(description: investment.description),
              const SizedBox(height: 24),
              const InvestmentActionButtonsRow(),
            ],
          ),
        ),
      ),
    );
  }
}
