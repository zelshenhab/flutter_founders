import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/requests_bloc.dart';
import 'bloc/requests_state.dart';
import 'widgets/request_card.dart';
import 'request_details/request_details_page.dart';

class RequestsPage extends StatefulWidget {
  const RequestsPage({super.key});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsBloc, RequestsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        if (state.requests.isEmpty) {
          return const Center(
            child: Text(
              'No requests available',
              style: TextStyle(color: Colors.white, fontFamily: 'InriaSans'),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 6, 16, 0),
          itemCount: state.requests.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final request = state.requests[index];
            return RequestCard(
              name: request.name,
              company: request.company,
              description: request.description,
              time: request.time,
              badge: request.badge,
              tags: request.tags,
              avatarUrl: request.avatarUrl,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RequestDetailsPage(request: request),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
