import 'package:flutter/material.dart';
import '../models/task.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({super.key});

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final priorityController = TextEditingController();
  final courseController = TextEditingController();
  final notesController = TextEditingController();

  Task? oldTask; 

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is Task) {
      oldTask = args;
      titleController.text = args.title;
      dateController.text = args.date ?? "";
      priorityController.text = args.priority ?? "";
      courseController.text = args.course ?? "";
      notesController.text = args.notes ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditMode = oldTask != null;

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
  backgroundColor: Colors.black.withOpacity(0.3),
  elevation: 0,
  title: Text(
    isEditMode ? "Modifier la tâche" : "Nouvelle tâche",
    style: const TextStyle(color: Colors.white),
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
              "assets/images/newtask_bg.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.25),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _field("Titre", titleController),
                _field("Date", dateController),
                _field("Priorité", priorityController),
                _field("Cours", courseController),
                _field("Notes", notesController),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Annuler"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final Task newTask = Task(
                          id: isEditMode
                              ? oldTask!.id
                              : DateTime.now().toString(),
                          title: titleController.text,
                          date: dateController.text,
                          priority: priorityController.text,
                          course: courseController.text,
                          notes: notesController.text,
                        );

                        Navigator.pop(context, {
                          "action": isEditMode ? "edit" : "create",
                          "task": newTask,
                        });
                      },
                      child:
                          Text(isEditMode ? "Enregistrer" : "Créer"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _field(String label, TextEditingController c) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.85),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: c,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
