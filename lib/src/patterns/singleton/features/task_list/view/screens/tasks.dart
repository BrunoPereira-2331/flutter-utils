import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_utils/src/layout/helpers/media_query_size_helper.dart';
import 'package:flutter_utils/src/layout/widgets/confirm_dialog.dart';
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

  bool isLoading = true;

  @override
  void initState() {
    Provider.of<TaskListViewModel>(context, listen: false)
        .fetchTasks()
        .then((value) => setState(() {
              isLoading = false;
            }));
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
                  l10n.labelTaskList,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: deviceAvaliableHeight * 0.8,
                width: deviceAvaliableWidth * 0.9,
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : buildTasksList(),
              )
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
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.add_task_rounded,
                      color: currentTask.finished ? Colors.green : Colors.black,
                    ),
                    onPressed: () =>
                        taskListViewModel.updateTaskStatus(currentTask),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                    ),
                    onPressed: () async {
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ConfirmDialog(titleMessage: l10n.labelDeleteTask, leftButtonMessage: l10n.labelNo, rightButtonMessage: l10n.labelYes, rightButtonCallback: () => print(""),);
                        },
                      );
                      // taskListViewModel.delete(currentTask),
                    }
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
