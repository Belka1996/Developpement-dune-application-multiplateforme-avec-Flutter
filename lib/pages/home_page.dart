import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [
    Task(id: "1", title: "Tache 1"),
    Task(id: "2", title: "Tache 2"),
    Task(id: "3", title: "Tache 3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

     appBar: AppBar(
   
  centerTitle: true,
  title: const Text(
    "Aujourd'hui",
    style: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.search, color: Colors.red),
      onPressed: () {
        Navigator.pushNamed(
      context,
      "/search",
      arguments: tasks, 
    );
      },
    ),
    IconButton(
      icon: const Icon(Icons.logout, color: Colors.red),
      onPressed: () {
        Navigator.pushReplacementNamed(context, "/login");
      },
    ),
  ],
),

      body: Stack(
        fit: StackFit.expand,
        children: [
        
          Image.asset(
            "assets/images/home_bg.jpg",
            fit: BoxFit.cover,
          ),

        
          Container(
            color: Colors.white.withOpacity(0.25),
          ),


          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      '/task-detail',
                      arguments: tasks[index],
                    );

                    if (result is Map) {
                      final action = result["action"];
                      final Task t = result["task"];

                      setState(() {
                        if (action == "edit") {
                          tasks[index] = t;
                        } else if (action == "delete") {
                          tasks.removeWhere((e) => e.id == t.id);
                        }
                      });
                    }
                  },
                  child: TaskCard(task: tasks[index]),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.pushNamed(context, '/new-task');

          if (result is Map && result["action"] == "create") {
            setState(() {
              tasks.add(result["task"]);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


