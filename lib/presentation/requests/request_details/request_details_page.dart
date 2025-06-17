import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/requests/request_details/widgets/request_user_company_info.dart';
import 'widgets/request_header.dart';
import 'widgets/request_description_card.dart';
import 'widgets/request_tags.dart';
import 'widgets/action_buttons_row.dart';

class RequestDetailsPage extends StatelessWidget {
  final String title;
  final String description;
  final List<String> tags;

  const RequestDetailsPage({
    super.key,
    required this.title,
    required this.description,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Запрос',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RequestHeader(),
            const SizedBox(height: 30),
            RequestDescriptionCard(description: description),
            const SizedBox(height: 10),
            RequestTags(tags: tags),
            const SizedBox(height: 12),
            const ActionButtonsRow(),
            const SizedBox(height: 16),
            const RequestUserCompanyInfo(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
