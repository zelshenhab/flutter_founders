import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/investment/models/details_investment_model.dart';

import 'bloc/investment_bloc.dart';
import 'bloc/investment_event.dart';
import 'bloc/investment_state.dart';
import 'widgets/investment_card.dart';
import 'investment_details/investment_details.dart';

class InvestmentPage extends StatefulWidget {
  const InvestmentPage({super.key});

  @override
  State<InvestmentPage> createState() => _InvestmentPageState();
}

class _InvestmentPageState extends State<InvestmentPage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<InvestmentBloc>().add(LoadInvestmentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvestmentBloc, InvestmentState>(
      builder: (context, state) {
        if (state is InvestmentLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        } else if (state is InvestmentLoaded) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            itemCount: state.investments.length,
            itemBuilder: (context, index) {
              final inv = state.investments[index];
              return InvestmentCard(
                title: inv.title,
                amount: inv.amount,
                period: inv.period,
                location: inv.location,
                tag: inv.tag,
                tagColor: Color(inv.tagColor),
                onTap: () {
                  final detailsModel = DetailsInvestmentModel(
                    title: inv.title,
                    amount: inv.amount,
                    period: inv.period,
                    location: inv.location,
                    description: 'Современное производство, выпускающее качественные удобрения для сельского хозяйства. Удобное расположение рядом с портом и сырьевыми базами делает завод выгодным партнёром для бизнеса.',
                    files: ['Бизнес план.pdf', 'Финансовая модель.pdf', 'Презентация.pdf'],
                    managerName: 'Pavel Glotov',
                    managerImage: 'https://via.placeholder.com/150',
                    managerTags: ['Маркетинг', 'Логистика', 'Управление'],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => InvestmentDetailsPage(investment: detailsModel),
                    ),
                  );
                },
              );
            },
          );
        } else if (state is InvestmentError) {
          return Center(
            child: Text(state.message, style: const TextStyle(color: Colors.red)),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
