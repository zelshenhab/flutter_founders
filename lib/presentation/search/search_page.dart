import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/search_bloc.dart';
import 'bloc/search_event.dart';
import 'widgets/search_bar_with_filter.dart';
import 'widgets/profile_list.dart';
import 'widgets/filter_bottom_sheet.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchBloc()..add(LoadProfiles()),
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final TextEditingController _controller = TextEditingController();

  void _openFilter() {
    showModalBottomSheet(
      context: context,
      builder: (_) => const FilterBottomSheet(),
      backgroundColor: Colors.black,
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Padding(
           padding: EdgeInsets.only(left: 8.0, top: 28, bottom: 10),
          child: Text(
          'Поиск',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontFamily: 'InriaSans', 
               fontSize: 20, letterSpacing: -0.6, height: 1.0),
        ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
      ),
      body: Column(
        children: [
          SearchBarWithFilter(
            controller: _controller,
            onFilterPressed: _openFilter,
          ),
          const SizedBox(height: 25),
          const Expanded(child: ProfileList()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
