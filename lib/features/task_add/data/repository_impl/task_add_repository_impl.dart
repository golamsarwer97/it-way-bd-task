import '../../domain/repository/task_add_repository.dart';
import '../model/task_add_request.dart';
import '../model/task_add_response.dart';
import '../remote/task_add_remote.dart';

class TaskAddRepositoryImpl implements TaskAddRepository {
  final TaskAddRemote taskAddRemote;

  TaskAddRepositoryImpl(this.taskAddRemote);

  @override
  Future<TaskAddResponse> taskAdd(
    TaskAddRequest taskAddRequest,
  ) async {
    TaskAddResponse taskAddResponse =
        await taskAddRemote.taskAdd(taskAddRequest);

    return taskAddResponse;
  }
}
