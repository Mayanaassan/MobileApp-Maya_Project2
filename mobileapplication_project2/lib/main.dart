import 'package:flutter/material.dart';
import 'task_service.dart'; // Import the TaskService class with addTask and deleteTask functions

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskManagerScreen(),
      debugShowCheckedModeBanner:false,
    );
  }
}

class TaskManagerScreen extends StatefulWidget {
  @override
  _TaskManagerScreenState createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  // Variables to hold task details
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();

  // Function to handle adding a task
  void addTask() {
    String title = titleController.text;
    String description = descriptionController.text;
    String dueDate = dueDateController.text;

    TaskService.addTask(title, description, dueDate);
  }

  // Function to handle deleting a task (passing task ID as argument)
  void deleteTask(int taskId) {
    TaskService.deleteTask(taskId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: dueDateController,
              decoration: InputDecoration(labelText: 'Due Date'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: addTask,
              child: Text('Add Task'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Example deletion of task with ID 1, replace with actual task ID
                deleteTask(1);
              },
              child: Text('Delete Task'),
            ),
          ],
        ),
      ),
    );
  }
}
