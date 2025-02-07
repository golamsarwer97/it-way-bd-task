import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as nav;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:todo_app/features/task_add/presentation/screens/task_add.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/utils.dart';
import '../../../task_details/presentation/screens/task_details.dart';
import '../cubit/task_list_cubit.dart';

class TaskListPage extends StatefulWidget {
  static const routeName = '/task-list';
  const TaskListPage({super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  @override
  initState() {
    super.initState();
    callTaskList();
  }

  callTaskList() {
    BlocProvider.of<TaskListCubit>(context).taskList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'TODOS',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
        body: BlocBuilder<TaskListCubit, TaskListState>(
            builder: (context, state) {
          if (state is TaskListFailure) {
            return const Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                'No todos available',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          }

          if (state is TaskListSuccess) {
            final taskItem = state.taskListResponse.todos;

            return ListView.builder(
              itemCount: taskItem.length,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) => TaskDetailsPage(
                    //       id: taskItem[index].id.toString(),
                    //       title: taskItem[index].todo.toString(),
                    //       isComplete: taskItem[index].completed,
                    //     ),
                    //   ),
                    // );
                    nav.Get.to(
                      () => TaskDetailsPage(
                        id: taskItem[index].id.toString(),
                        title: taskItem[index].todo.toString(),
                        isComplete: taskItem[index].completed,
                      ),
                      transition: nav.Transition.rightToLeft,
                      duration: const Duration(milliseconds: 600),
                      preventDuplicates: false,
                      opaque: true,
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    elevation: 5,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppPalette.gradient2,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        title: Text(
                          taskItem[index].todo.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Status: ${taskItem[index].completed ? 'Completed' : 'Pending'}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Expanded(
            child: Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: AppPalette.gradient2,
                size: 50,
              ),
            ),
          );
        }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppPalette.gradient2,
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => TaskAddPage(),
            //   ),
            // );
            nav.Get.to(
              () => TaskAddPage(),
              transition: nav.Transition.rightToLeft,
              duration: const Duration(milliseconds: 600),
              preventDuplicates: false,
              opaque: true,
            );
          },
          tooltip: 'Add New Todo',
          shape: CircleBorder(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
