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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
  backgroundColor: Colors.black.withOpacity(0.3),
  elevation: 0,
  title: const Text(
    "Recherche",
    style: TextStyle(color: Colors.white), 
  ),

  leading: IconButton(
    icon: const Icon(Icons.home, color: Colors.red),
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/home');
    },
  ),

  actions: [
    IconButton(
      icon: const Icon(Icons.logout, color: Colors.red),
      onPressed: () {
        Navigator.pushReplacementNamed(context, '/login');
      },
    ),
  ],
),


      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/search.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.3),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                TextField(
                  controller: searchController,
                  onChanged: updateSearch,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Rechercher une tâche...",
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      final t = results[index];
                      return Card(
                        child: ListTile(
                          title: Text(t.title),
                          subtitle: Text(t.date ?? "Aucune date"),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/task-detail',
                              arguments: t,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

