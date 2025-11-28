import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/new_task_page.dart';
import 'pages/task_detail_page.dart';
import 'pages/search_page.dart';

void main() {
  runApp(const StudyApp());
}

class StudyApp extends StatelessWidget {
  const StudyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
        '/new-task': (_) => const NewTaskPage(),
        '/task-detail': (_) => const TaskDetailPage(),
        '/search': (_) => const SearchPage(),
      },
       );
  }
}
