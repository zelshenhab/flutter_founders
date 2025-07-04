import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/create_request_bloc.dart';
import '../bloc/create_request_event.dart';
import '../bloc/create_request_state.dart';

class DescriptionField extends StatelessWidget {
  const DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateRequestBloc, CreateRequestState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Запрос',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'InriaSans'
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) => context.read<CreateRequestBloc>().add(
                DescriptionChanged(value),
              ),
              style: const TextStyle(color: Colors.white, fontFamily: 'InriaSans'),
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Минимум 120 символов',
                hintStyle: const TextStyle(color: Colors.grey, fontFamily: 'InriaSans'),
                filled: true,
                fillColor: const Color.fromARGB(255, 40, 40, 42),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
