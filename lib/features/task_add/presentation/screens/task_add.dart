import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/task_list/presentation/screens/task_list.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/app_loading.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/utils.dart';
import '../../data/model/task_add_request.dart';
import '../cubit/task_add_cubit.dart';
import '../widgets/auth_input.dart';
import '../widgets/drop_down.dart';

class TaskAddPage extends StatefulWidget {
  static const routeName = '/add-task';
  const TaskAddPage({
    super.key,
  });

  @override
  State<TaskAddPage> createState() => _TaskAddPageState();
}

class _TaskAddPageState extends State<TaskAddPage> {
  TaskAddRequest taskAddRequest =
      TaskAddRequest(todo: '', completed: false, userId: 1);

  callTaskAdd() {
    BlocProvider.of<TaskAddCubit>(context).taskAdd(taskAddRequest);
  }

  final formKey = GlobalKey<FormState>();
  bool isCompleted = false;

  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController descriptionTextController =
      TextEditingController();

  @override
  void dispose() {
    titleTextController.dispose();
    descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New TODO',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: mediaquery.width,
          height: mediaquery.height,
          child: Padding(
            padding: const EdgeInsets.only(top: 38.0, left: 15, right: 15),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10),
                  AuthInput(
                    hintText: 'Name of the task',
                    controller: titleTextController,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10),
                  AuthInput(
                    hintText: 'Description of the task',
                    controller: descriptionTextController,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 100,
                    width: 500,
                    child: DropDown(
                      title: 'Status',
                      items: ['Completed', 'Pending'],
                      hintText: "Select Status here",
                      onChanged: (value) {
                        final selectedStatus =
                            value == 'Completed' ? true : false;

                        setState(() {
                          isCompleted = selectedStatus;
                          print(isCompleted);
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: BlocListener<TaskAddCubit, TaskAddState>(
        listener: (context, state) {
          if (state is TaskAddSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const TaskListPage()),
              (route) => false,
            );
            getSnackBar('New Task Added');
          }
          if (state is TaskAddFailure) {
            debugPrint("In TaskAddFailure");
            final ex = state.exception;
            print(ex);
            if (ex is ServerException) {
              debugPrint("In ServerException");
              debugPrint("${ex.statusCode}");

              showAppDialog(context, title: ex.message);
            } else if (ex is NoInternetException) {
              showAppDialog(context,
                  title: 'Please check your network connectivity');
            } else {
              showAppDialog(context, title: ex.toString());
            }
          }
          if (state is TaskAddLoading) {
            showAppLoading(context);
          }
        },
        child: FloatingActionButton.extended(
          backgroundColor: AppPalette.gradient2,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              taskAddRequest.todo = titleTextController.text;
              taskAddRequest.completed = isCompleted;
              print(isCompleted);
              callTaskAdd();
            }
          },
          tooltip: 'Add New Task',
          // shape: CircleBorder(),
          icon: const Icon(Icons.add),
          label: Text('Add New Task'),
        ),
      ),
    );
  }
}
