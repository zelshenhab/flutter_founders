import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../requests/bloc/requests_bloc.dart';
import '../requests/widgets/request_card.dart';
import '../requests/widgets/request_filter_bar.dart';
import '../requests/bloc/requests_state.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Founders',
          style: TextStyle(
            fontFamily: 'InriaSerif',
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(Icons.edit_note, color: Colors.white, size: 38),
          SizedBox(width: 16),
          Icon(Icons.notifications_none, color: Colors.white, size: 38),
          SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          const RequestFilterBar(),
          Expanded(
            child: BlocBuilder<RequestsBloc, RequestsState>(
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
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                  itemCount: state.requests.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
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
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
