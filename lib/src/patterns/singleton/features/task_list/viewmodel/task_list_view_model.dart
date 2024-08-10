import 'package:flutter/material.dart';
import 'package:flutter_utils/src/patterns/singleton/core/models/task.dart';

class TaskListViewModel extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    Future.delayed(const Duration(seconds: 1));

    _tasks = [
      Task(id: 1, name: "Clean the car"),
      Task(id: 2, name: "Do the grocery"),
      Task(id: 3, name: "Sleep"),
    ];
    notifyListeners();
  }

  void updateTaskStatus(Task taskToUpdate) {
     Task updatedTask = Task(
      id: taskToUpdate.id,
      name: taskToUpdate.name,
      finished: !taskToUpdate.finished, // Toggle the status
    );
    int indexOldTask =
        _tasks.indexWhere((oldTask) => oldTask.id == taskToUpdate.id);
    _tasks[indexOldTask] = updatedTask;
    notifyListeners();
  }
}
