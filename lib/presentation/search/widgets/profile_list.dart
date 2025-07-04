import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/search_bloc.dart';
import '../bloc/search_state.dart';
import '../models/profile_model.dart';
import 'profile_card.dart';

class ProfileList extends StatelessWidget {
  const ProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SearchLoaded) {
          final List<ProfileModel> profiles = state.profiles;

          if (profiles.isEmpty) {
            return const Center(
              child: Text(
                'Ничего не найдено',
                style: TextStyle(color: Colors.grey, fontFamily: 'InriaSans'),
              ),
            );
          }

          return ListView.builder(
            itemCount: profiles.length,
            padding: const EdgeInsets.only(bottom: 80),
            itemBuilder: (context, index) {
              return ProfileCard(profile: profiles[index]);
            },
          );
        } else if (state is SearchError) {
          return Center(
            child: Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
