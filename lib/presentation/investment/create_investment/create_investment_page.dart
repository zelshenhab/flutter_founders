import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_founders/presentation/investment/create_investment/bloc/create_investment_bloc.dart';
import 'package:flutter_founders/presentation/investment/create_investment/bloc/create_investment_event.dart';
import 'package:flutter_founders/presentation/investment/create_investment/bloc/create_investment_state.dart';
import 'package:flutter_founders/presentation/investment/create_investment/widgets/additional_investment_textField.dart';
import 'package:flutter_founders/presentation/investment/create_investment/widgets/investment_submit_button.dart';
import 'package:flutter_founders/presentation/investment/create_investment/widgets/investment_text_field.dart';
import 'package:flutter_founders/presentation/investment/create_investment/widgets/investment_file_upload.dart';

class CreateInvestmentPage extends StatelessWidget {
  const CreateInvestmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CreateInvestmentForm();
  }
}

class _CreateInvestmentForm extends StatelessWidget {
  const _CreateInvestmentForm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Новая инвестиция',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'InriaSans', // 👈 Applied here
          ),
        ),
      ),
      body: BlocBuilder<CreateInvestmentBloc, CreateInvestmentState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InvestmentTextField(
                  label: 'Название инвестиции',
                  hintText: 'Введите название',
                  initialValue: state.title,
                  onChanged: (value) => context.read<CreateInvestmentBloc>().add(
                        UpdateTextField(fieldKey: 'title', value: value),
                      ),
                ),
                const SizedBox(height: 10),
                InvestmentTextField(
                  label: 'Описание',
                  hintText: 'Минимум 120 символов',
                  minLines: 3,
                  maxLines: 5,
                  initialValue: state.description,
                  onChanged: (value) => context.read<CreateInvestmentBloc>().add(
                        UpdateTextField(fieldKey: 'description', value: value),
                      ),
                ),
                const SizedBox(height: 10),
                InvestmentTextField(
                  label: 'Сумма',
                  hintText: 'Введите сумму',
                  initialValue: state.amount,
                  onChanged: (value) => context.read<CreateInvestmentBloc>().add(
                        UpdateTextField(fieldKey: 'amount', value: value),
                      ),
                ),
                const SizedBox(height: 10),
                InvestmentTextField(
                  label: 'Срок окупаемости',
                  hintText: 'Введите срок в месяцах',
                  initialValue: state.period,
                  onChanged: (value) => context.read<CreateInvestmentBloc>().add(
                        UpdateTextField(fieldKey: 'period', value: value),
                      ),
                ),
                const SizedBox(height: 10),
                InvestmentTextField(
                  label: 'Страна',
                  hintText: 'Введите страну',
                  initialValue: state.country,
                  onChanged: (value) => context.read<CreateInvestmentBloc>().add(
                        UpdateTextField(fieldKey: 'country', value: value),
                      ),
                ),
                const SizedBox(height: 10),
                InvestmentFileUpload(
                  label: 'Бизнес-план',
                  file: state.documents['doc1'],
                  onUpload: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result != null && result.files.single.path != null) {
                      final file = File(result.files.single.path!);
                      context.read<CreateInvestmentBloc>().add(UploadFile(type: 'doc1', file: file));
                    }
                  },
                ),
                const SizedBox(height: 10),
                InvestmentFileUpload(
                  label: 'Финансовая модель',
                  file: state.documents['doc2'],
                  onUpload: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result != null && result.files.single.path != null) {
                      final file = File(result.files.single.path!);
                      context.read<CreateInvestmentBloc>().add(UploadFile(type: 'doc2', file: file));
                    }
                  },
                ),
                const SizedBox(height: 10),
                InvestmentFileUpload(
                  label: 'Презентация',
                  file: state.documents['doc3'],
                  onUpload: () async {
                    final result = await FilePicker.platform.pickFiles();
                    if (result != null && result.files.single.path != null) {
                      final file = File(result.files.single.path!);
                      context.read<CreateInvestmentBloc>().add(UploadFile(type: 'doc3', file: file));
                    }
                  },
                ),
                const SizedBox(height: 10),
                AdditionalInvestmentTextField(),
                const SizedBox(height: 20),
                InvestmentSubmitButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
