import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_utils/src/layout/helpers/media_query_size_helper.dart';
import 'package:flutter_utils/src/patterns/singleton/core/models/task.dart';
import 'package:flutter_utils/src/patterns/singleton/features/task_list/viewmodel/task_list_view_model.dart';
import 'package:flutter_utils/src/translate/l10n.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late AppLocalizations l10n;

  double deviceAvaliableHeight = 0;
  double deviceAvaliableWidth = 0;
  // final TaskListViewModel _taskListViewModel = TaskListViewModel();

  @override
  void initState() {
    Provider.of<TaskListViewModel>(context, listen: false).fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    l10n = context.l10n;
    Size mediaQuerySize = MediaQuerySizeHelper(context).sizeProperties();
    deviceAvaliableHeight = mediaQuerySize.height;
    deviceAvaliableWidth = mediaQuerySize.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: deviceAvaliableHeight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  l10n.taskListLabel,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Container(
                height: 250,
                width: deviceAvaliableWidth * 0.8,
                child: buildTasksList(),
              )
              // TextButton(
              //   child: Text("Login Screen"),
              //   onPressed: () async {
              //     Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTasksList() {
    TaskListViewModel taskListViewModel =
        Provider.of<TaskListViewModel>(context, listen: false);
    List<Task> tasks =
        Provider.of<TaskListViewModel>(context, listen: false).tasks;
    return Consumer<TaskListViewModel>(
      builder: (BuildContext ctx, _, Widget? child) {
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            Task currentTask = tasks[index];
            return ListTile(
              title: Text(currentTask.name),
              trailing: IconButton(
                icon: Icon(
                  Icons.add_task_rounded,
                  color: currentTask.finished ? Colors.green : Colors.black,
                ),
                onPressed: () =>
                    taskListViewModel.updateTaskStatus(currentTask),
              ),
            );
          },
        );
      },
    );
  }
}
