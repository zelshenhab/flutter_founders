import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/investment/models/details_investment_model.dart';
import 'widgets/investment_header.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Инвестиция',
          style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'InriaSans'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InvestmentHeader(model: investment),
              const SizedBox(height: 24),

              InvestmentManagerInfo(
                name: investment.managerName,
                imageUrl: investment.managerImage,
                tags: investment.managerTags,
              ),
              const SizedBox(height: 24),

              InvestmentDescriptionCard(description: investment.description),
              const SizedBox(height: 32),

              const InvestmentActionButtonsRow(),
            ],
          ),
        ),
      ),
    );
  }
}
