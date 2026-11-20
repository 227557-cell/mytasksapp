import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskListPage(),
    );
  }
}

class TaskListPage extends StatefulWidget {
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {

  List<Map<String, dynamic>> tasks = [
    {'title': 'Study Flutter', 'isCompleted': false},
    {'title': 'Do Homework', 'isCompleted': true},
    {'title': 'Read Book', 'isCompleted': false},
    {'title': 'Practice Coding', 'isCompleted': true},
  ];

  @override
  Widget build(BuildContext context) {

    int completed = tasks
        .where((task) => task['isCompleted'] == true)
        .length;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Tasks'),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          Text(
            'Completed: $completed / ${tasks.length}',
          ),

          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tasks[index]['title']),
                  trailing: Checkbox(
                    value: tasks[index]['isCompleted'],
                    onChanged: (value) {
                      setState(() {
                        tasks[index]['isCompleted'] = value;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}