import '../../domain/repository/task_list_repository.dart';
import '../model/task_list_response.dart';
import '../remote/task_list_remote.dart';

class TaskListRepositoryImpl implements TaskListRepository {
  final TaskListRemote taskListRemote;

  TaskListRepositoryImpl(this.taskListRemote);

  @override
  Future<TaskListResponse> taskList() async {
    TaskListResponse taskListResponse = await taskListRemote.taskList();

    return taskListResponse;
  }
}
