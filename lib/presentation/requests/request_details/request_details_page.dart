import 'package:flutter/material.dart';
import '../bloc/requests_state.dart';
import 'widgets/request_header.dart';
import 'widgets/request_tags.dart';
import 'widgets/request_description_card.dart';
import 'widgets/request_user_company_info.dart';
import 'widgets/action_buttons_row.dart';

class RequestDetailsPage extends StatelessWidget {
  final RequestData request;

  const RequestDetailsPage({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Запрос', style: TextStyle(color: Colors.white, fontFamily: 'InriaSans')),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequestHeader(
              name: request.name,
              company: request.company,
              avatarUrl: request.avatarUrl,
              time: request.time,
            ),
            const SizedBox(height: 16),

            RequestDescriptionCard(description: request.description),
            const SizedBox(height: 2),

            RequestTags(tags: request.tags),
            const SizedBox(height: 10),

            const ActionButtonsRow(),
            const SizedBox(height: 16),

            const RequestUserCompanyInfo(),
          ],
        ),
      ),
    );
  }
}
