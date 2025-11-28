import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aujourd'hui"),
      ),
      body:ListView(
        children: const [
          ListTile(title: Text("Tache 1")),
          ListTile(title: Text("Tache 2")),
          ListTile(title: Text("Tache 3")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.pushNamed(context, '/new-task');
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}