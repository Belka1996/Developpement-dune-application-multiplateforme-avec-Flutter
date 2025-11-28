import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        title: Text(task.title),
        subtitle: Text(task.date ?? "aucune date"),
        trailing: Icon(
          task.isfavorite ? Icons.star : Icons.star_border,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, "/task-detail",
          arguments: task);
        },
      ),
    );
  }
}