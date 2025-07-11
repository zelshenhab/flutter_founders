import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/requests/create_request/bloc/create_request_bloc.dart';
import 'package:flutter_founders/presentation/requests/create_request/widgets/description_field.dart';
import 'package:flutter_founders/presentation/requests/create_request/widgets/submit_button.dart';
import 'package:flutter_founders/presentation/requests/create_request/widgets/tag_selector.dart';
import 'package:flutter_founders/presentation/requests/create_request/widgets/title_field.dart';
import 'package:flutter_founders/presentation/requests/create_request/widgets/additional_field.dart';

class CreateRequestPage extends StatelessWidget {
  const CreateRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateRequestBloc(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Создать запрос',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'InriaSans',
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TitleField(),
                  SizedBox(height: 20),
                  DescriptionField(),
                  SizedBox(height: 20),
                  TagSelector(availableTags: []),
                  SizedBox(height: 20),
                  AdditionalField(),
                  SizedBox(height: 32),
                  SubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
