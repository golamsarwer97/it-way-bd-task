import '../../domain/repository/task_update_status_repository.dart';
import '../model/task_update_status_request.dart';
import '../model/task_update_status_response.dart';
import '../remote/task_update_status_remote.dart';

class TaskUpdateStatusRepositoryImpl implements TaskUpdateStatusRepository {
  final TaskUpdateStatusRemote taskUpdateStatusRemote;

  TaskUpdateStatusRepositoryImpl(this.taskUpdateStatusRemote);

  @override
  Future<TaskUpdateStatusResponse> taskUpdateStatus(
    String taskId,
    TaskUpdateStatusRequest taskUpdateStatusRequest,
  ) async {
    TaskUpdateStatusResponse taskUpdateStatusResponse =
        await taskUpdateStatusRemote.taskUpdateStatus(
      taskId,
      taskUpdateStatusRequest,
    );

    return taskUpdateStatusResponse;
  }
}
