import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Task task = ModalRoute.of(context)!.settings.arguments as Task;

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
  backgroundColor: Colors.black.withOpacity(0.3),
  elevation: 0,
  title: const Text(
    "Détails",
    style: TextStyle(color: Colors.white),
  ),

  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.red),
    onPressed: () {
      Navigator.pop(context);
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
              "assets/images/taskdetail_bg.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.25),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: ListView(
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(task.date ?? "Aucune date"),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    const Icon(Icons.flag, color: Colors.red),
                    const SizedBox(width: 8),
                    Text(task.priority ?? "Aucune priorité"),
                  ],
                ),
                const SizedBox(height: 15),

                Row(
                  children: [
                    const Icon(Icons.book, color: Colors.deepPurple),
                    const SizedBox(width: 8),
                    Text(task.course ?? "Aucun cours"),
                  ],
                ),

                const SizedBox(height: 30),

                const Text(
                  "Notes",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(task.notes ?? "Pas de notes"),
                ),

                const SizedBox(height: 40),

                ElevatedButton.icon(
                  onPressed: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      '/new-task',
                      arguments: task,
                    );

                    if (result is Map && result["action"] == "edit") {
                      Navigator.pop(context, result);
                    }
                  },
                  icon: const Icon(Icons.edit),
                  label: const Text("Modifier la tâche"),
                ),

                const SizedBox(height: 20),

                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.pop(context, {
                      "action": "delete",
                      "task": task,
                    });
                  },
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text("Supprimer la tâche"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
