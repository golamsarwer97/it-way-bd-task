import '../../data/model/task_update_status_request.dart';
import '../../data/model/task_update_status_response.dart';

abstract class TaskUpdateStatusRepository {
  Future<TaskUpdateStatusResponse> taskUpdateStatus(
    String taskId,
    TaskUpdateStatusRequest taskUpdateStatusRequest,
  );
}
