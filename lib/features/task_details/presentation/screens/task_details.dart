import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/task_list/presentation/screens/task_list.dart';

import '../../../../common/widgets/app_dialog.dart';
import '../../../../common/widgets/app_loading.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/utils/utils.dart';
import '../../../task_update_status/data/model/task_update_status_request.dart';
import '../../../task_update_status/presentation/cubit/task_update_status_cubit.dart';

class TaskDetailsPage extends StatefulWidget {
  static const routeName = '/task-details';
  final String? id, title;
  final bool? isComplete;
  const TaskDetailsPage({
    super.key,
    this.id,
    this.title,
    this.isComplete,
  });

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  TaskUpdateStatusRequest taskUpdateStatusRequest =
      TaskUpdateStatusRequest(completed: false);

  callTaskUpdateStatus() {
    BlocProvider.of<TaskUpdateStatusCubit>(context)
        .taskUpdateStatus(widget.id.toString(), taskUpdateStatusRequest);
  }

  void updateStatus() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text('Confirmation'),
          content: Text(
              'Are you sure you want to ${widget.isComplete! ? 'Incomplete' : 'Completed'} this task?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // No button clicked
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Yes button clicked
                setState(() {
                  taskUpdateStatusRequest.completed = !widget.isComplete!;
                  callTaskUpdateStatus();
                });
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO Details',
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
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Text(DateFormat('dd-MM-yyyy').format(taskItem.updatedAt).toString()),
                      const SizedBox(width: 8),
                      // Text(DateFormat('hh-mm a').format(taskItem.updatedAt).toString()),
                    ],
                  ),
                ),
                Flexible(
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    elevation: 5,
                    child: Container(
                      width: double.infinity,
                      // height: MediaQuery.sizeOf(context).height / 2,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      decoration: BoxDecoration(
                        color: AppPalette.gradient2,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title: ${widget.title}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Description: ",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.title.toString(),
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Status: ${widget.isComplete! ? 'Completed' : 'Pending'}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton:
          BlocListener<TaskUpdateStatusCubit, TaskUpdateStatusState>(
        listener: (context, state) {
          if (state is TaskUpdateStatusSuccess) {
            // final responseModel = state.taskUpdateStatusResponse;
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const TaskListPage()),
              (route) => false,
            );
            getSnackBar('Task Status Updated');
          }
          if (state is TaskUpdateStatusFailure) {
            debugPrint("In TaskUpdateStatusFailure");
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
          if (state is TaskUpdateStatusLoading) {
            showAppLoading(context);
          }
        },
        child: FloatingActionButton.extended(
          backgroundColor: AppPalette.gradient2,
          onPressed: updateStatus,
          tooltip: 'Update Status',
          // shape: CircleBorder(),
          icon: const Icon(Icons.update_outlined),
          label: Text('Update Status'),
        ),
      ),
    );
  }
}
