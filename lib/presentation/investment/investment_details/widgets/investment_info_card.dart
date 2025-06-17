import 'package:flutter/material.dart';
import 'package:flutter_founders/presentation/investment/investment_details/widgets/pdf_viewer_page.dart';
import 'package:flutter_founders/presentation/investment/models/details_investment_model.dart'; 

class InvestmentInfoCard extends StatelessWidget {
  final DetailsInvestmentModel investment;

  const InvestmentInfoCard({super.key, required this.investment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow('Объём привлекаемых средств', investment.amount),
          _infoRow('Срок окупаемости', investment.period),
          _infoRow('Страна реализации', investment.location),
          const SizedBox(height: 12),
          for (final fileName in investment.files) _fileButton(context, fileName),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _fileButton(BuildContext context, String fileName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PdfViewerPage(
                assetPath: 'assets/pdfs/$fileName',
                title: fileName,
              ),
            ),
          );
        },
        child: Text(fileName),
      ),
    );
  }
}
