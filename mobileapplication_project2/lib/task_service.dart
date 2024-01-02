import 'package:http/http.dart' as http;
import 'task.dart';
class TaskService {
  static const String baseUrl = 'https://csci410mayanaassan.000webhost.com';

  static Future<void> addTask(
      String title, String description, String dueDate) async {
    final url = '$baseUrl/addTasks.php';

    final response = await http.post(Uri.parse(url), body: {
      'title': title,
      'description': description,
      'due_date': dueDate,
    });

    if (response.statusCode == 200) {
      print('Task added successfully');
    } else {
      print('Failed to add task. Error: ${response.reasonPhrase}');
    }
  }

  static Future<void> deleteTask(int taskId) async {
    final url = '$baseUrl/deleteTasks.php';

    final response = await http.post(Uri.parse(url), body: {
      'task_id': taskId.toString(),
    });

    if (response.statusCode == 200) {
      print('Task deleted successfully');
    } else {
      print('Failed to delete task. Error: ${response.reasonPhrase}');
    }
  }
}
// Assuming this is a form where users input task details
void onSubmitButtonPressed() {
  String title = 'Sample Title'; // Replace with actual user input
  String description = 'Sample Description'; // Replace with actual user input
  String dueDate = '2024-01-31'; // Replace with actual user input

  TaskService.addTask(title, description, dueDate);
}
// Assuming this is a delete button that triggers the deletion
void onDeleteButtonPressed(int taskId) {
  TaskService.deleteTask(taskId);
}
