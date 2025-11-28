 import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';


class HomePage extends StatefulWidget{
  const HomePage({super.key});

@override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks =[
    Task(id: "1", title: "Tache 1"),
    Task(id: "1", title: "tache 2"),
    Task(id: "3", title: "tache 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aujourd'hui"),
      ),
      body:ListView.builder(
         itemCount: tasks.length,
         itemBuilder: (context, index) {
           return TaskCard(task: tasks[index]);
         },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
         final newTask = await Navigator.pushNamed(context, '/new-task');
         if (newTask is Task) {
          setState(() {
            tasks.add(newTask);
          });
         }
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}