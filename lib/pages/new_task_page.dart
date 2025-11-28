import 'package:flutter/material.dart';
import 'package:flutter_study_app/models/task.dart';
 

class NewTaskPage extends StatefulWidget {
  const NewTaskPage ({super.key});
  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}
class _NewTaskPageState extends State<NewTaskPage> {
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final priorityController = TextEditingController();
  final courseController = TextEditingController();
  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouvelle tache"),
        backgroundColor: const Color.fromARGB(255, 233, 226, 226),
        elevation: 0,
      ),
      body: Padding(
       padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            customTextField("Titre", titleController),
            customTextField("Date", dateController),
            customTextField("Priorité", priorityController),
            customTextField("Cours", courseController),
            customTextField("Notes", notesController),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Annuler"),
                ),
                ElevatedButton(
                  onPressed: (){
                    final newTask = Task(
                      id: DateTime.now().toString(),
                      title: titleController.text,
                      date: dateController.text,
                      priority: priorityController.text,
                      course: courseController.text,
                      notes: notesController.text,
                    );
                    Navigator.pop(context, newTask);
                  }, 
                  child: const Text("Enregistrer"),
                ),
              ],
          )
        ],
      ),
    ),
  );
}
Widget customTextField(String label, TextEditingController controller){
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 108, 112, 251),
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: InputBorder.none,
        ),
      ),
    );
  }
}

