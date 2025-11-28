import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent.withOpacity(0.2),
          child: Text(
            task.title.isNotEmpty ? task.title[0].toUpperCase() : "?",
            style: const TextStyle(color: Colors.blue),
          ),
        ),
        title: Text(
          task.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          task.date ?? "Aucune date",
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: Icon(
          task.isfavorite ? Icons.star : Icons.star_border,
          color: task.isfavorite  ? Colors.amber: Colors.grey,
          size: 28,
        ),
        onTap: () {
          Navigator.pushNamed(context, "/task-detail",
          arguments: task);
        },
      ),
    );
  }
}