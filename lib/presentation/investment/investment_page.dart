import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/investment_bloc.dart';
import 'bloc/investment_event.dart';
import 'bloc/investment_state.dart';
import 'widgets/investment_card.dart';

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
        return const Center(child: CircularProgressIndicator(color: Colors.white));
      } else if (state is InvestmentLoaded) {
        return ListView.builder(
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
