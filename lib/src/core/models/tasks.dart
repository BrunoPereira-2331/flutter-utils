import 'package:flutter_utils/src/core/models/task.dart';

class Tasks {
    final List<TaskList> _dummy_list = [
      TaskList(id: 1, name: "Clean the car"),
      TaskList(id: 2, name: "Do the grocery"),
      TaskList(id: 3, name: "Sleep"),
    ];

    List<TaskList> getDummyData() {
      return _dummy_list;
    }

    addTaskToList(TaskList taskList) {
      _dummy_list.add(taskList);

    }
    removeFromTaskList(taskId) {
      _dummy_list.removeWhere((element) => element.id == taskId);
    }

}