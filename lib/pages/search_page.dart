import 'package:flutter/material.dart';
import '../models/task.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Task> allTasks = [];
  List<Task> results = [];
  final searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is List<Task>) {
      allTasks = args;
      results = args;
    }
  }

  void updateSearch(String query) {
    query = query.toLowerCase();
    setState(() {
      results =
          allTasks.where((t) => t.title.toLowerCase().contains(query)).toList();
    });
  }
}
