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
  Task? existingTask;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final data = ModalRoute.of(context)!.settings.arguments;

    if (data is Task) {
      existingTask = data;

      titleController.text = existingTask!.title;
      dateController.text = existingTask!.date ?? "";
      priorityController.text = existingTask!.priority ?? "";
      courseController.text = existingTask!.course ?? "";
      notesController.text = existingTask!.notes ?? "";
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(existingTask == null ? "Nouvelle tache" : "Modifier tache"),
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
                      id: existingTask?.id ?? DateTime.now().toString(),
                      title: titleController.text,
                      date: dateController.text,
                      priority: priorityController.text,
                      course: courseController.text,
                      notes: notesController.text,
                      isfavorite: existingTask?.isfavorite ?? false,
                    );
                    Navigator.pop(context, {
                      "action": existingTask == null ? "create" : "edit",
                      "task": newTask,
                    });
                  }, 
                  child: Text(existingTask == null ? "Enregistrer" : "Modifier"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
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


