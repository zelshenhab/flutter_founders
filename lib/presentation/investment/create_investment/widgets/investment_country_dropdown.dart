import 'package:flutter/material.dart';

class InvestmentCountryDropdown extends StatelessWidget {
  final String? selected;
  final List<String> countries;
  final Function(String?) onChanged;

  const InvestmentCountryDropdown({
    super.key,
    required this.selected,
    required this.countries,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Страна реализации',
            style: TextStyle(color: Colors.white, fontSize: 14, fontFamily: 'InriaSans'),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: selected,
            icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            dropdownColor: Colors.grey.shade900,
            style: const TextStyle(color: Colors.white, fontFamily: 'InriaSans'),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade900,
              hintText: 'Выберите страну',
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5), fontFamily: 'InriaSans'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            ),
            items: countries.map((country) {
              return DropdownMenuItem(
                value: country,
                child: Text(country),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
