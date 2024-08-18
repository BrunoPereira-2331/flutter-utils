import 'package:flutter/material.dart';
import 'package:flutter_utils/src/patterns/singleton/core/models/task.dart';

class TaskListViewModel extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    Future.delayed(const Duration(seconds: 1));

    _tasks = [
      Task(id: 1, name: "Task 1 - Clean the car"),
      Task(id: 2, name: "Task 2 - Do the grocery"),
      Task(id: 3, name: "Task 3 - Sleep"),
      Task(id: 4, name: "Task 4 - Clean the car"),
      Task(id: 5, name: "Task 5 - Do the grocery"),
      Task(id: 6, name: "Task 6 - Sleep"),
      Task(id: 7, name: "Task 7 - Clean the car"),
      Task(id: 8, name: "Task 8 - Do the grocery"),
      Task(id: 9, name: "Task 9 - Sleep"),
      Task(id: 10, name: "Task 10 - Clean the car"),
      Task(id: 11, name: "Task 11 - Do the grocery"),
      Task(id: 12, name: "Task 12 - Sleep"),
      Task(id: 13, name: "Task 13 - Clean the car"),
      Task(id: 14, name: "Task 14 - Do the grocery"),
      Task(id: 15, name: "Task 15 - Sleep"),
      Task(id: 16, name: "Task 16 - Clean the car"),
      Task(id: 17, name: "Task 17 - Do the grocery"),
      Task(id: 18, name: "Task 18 - Sleep"),
      Task(id: 19, name: "Task 19 - Clean the car"),
      Task(id: 20, name: "Task 20 - Do the grocery"),
      Task(id: 21, name: "Task 21 - Sleep"),
      Task(id: 22, name: "Task 22 - Clean the car"),
      Task(id: 23, name: "Task 23 - Do the grocery"),
      Task(id: 24, name: "Task 24 - Sleep"),
      Task(id: 25, name: "Task 25 - Clean the car"),
      Task(id: 26, name: "Task 26 - Do the grocery"),
      Task(id: 27, name: "Task 27 - Sleep"),
      Task(id: 28, name: "Task 28 - Clean the car"),
      Task(id: 29, name: "Task 29 - Do the grocery"),
      Task(id: 30, name: "Task 30 - Sleep"),
      Task(id: 31, name: "Task 31 - Clean the car"),
      Task(id: 32, name: "Task 32 - Do the grocery"),
      Task(id: 33, name: "Task 33 - Sleep"),
      Task(id: 34, name: "Task 34 - Clean the car"),
      Task(id: 35, name: "Task 35 - Do the grocery"),
      Task(id: 36, name: "Task 36 - Sleep"),
      Task(id: 37, name: "Task 37 - Clean the car"),
      Task(id: 38, name: "Task 38 - Do the grocery"),
      Task(id: 39, name: "Task 39 - Sleep"),
      Task(id: 40, name: "Task 40 - Clean the car"),
    ];
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

  void delete(Task taskToDelete) {
    _tasks.removeWhere((task) => task.id == taskToDelete.id);
    notifyListeners();
  }
}
