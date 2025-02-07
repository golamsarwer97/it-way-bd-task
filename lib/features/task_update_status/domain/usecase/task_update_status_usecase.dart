import '../../data/model/task_update_status_request.dart';
import '../../data/model/task_update_status_response.dart';

import '../repository/task_update_status_repository.dart';

class TaskUpdateStatusUsecase {
  final TaskUpdateStatusRepository _taskUpdateStatusRepository;

  TaskUpdateStatusUsecase(this._taskUpdateStatusRepository);

  Future<TaskUpdateStatusResponse> call(
    String taskId,
    TaskUpdateStatusRequest taskUpdateStatusRequest,
  ) =>
      _taskUpdateStatusRepository.taskUpdateStatus(
          taskId, taskUpdateStatusRequest);
}
