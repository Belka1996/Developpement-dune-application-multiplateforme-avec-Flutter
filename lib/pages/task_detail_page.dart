import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 20, color: Colors.blue),
                const SizedBox(width: 8),
                Text(task.date ?? "Aucune date"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.flag, size: 20, color: Colors.red),
                const SizedBox(width: 8),
                Text(task.priority ?? "Aucune priorité"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.book, size: 20, color: Colors.green),
                const SizedBox(width: 8),
                Text(task.course ?? "Aucune cours"),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Notes",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(task.notes ?? "Pas de notes"),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.pushNamed(
                  context,
                   '/new-task',
                   arguments: task,
                );
                if (result is Map && result["action"] == "edit"){
                  Navigator.pop(context, result);
                }
              },
              icon: const Icon(Icons.edit),
              label: const Text("Modifier la tache"),
            ),
          ],
        ),
      ),
    );
  }
}