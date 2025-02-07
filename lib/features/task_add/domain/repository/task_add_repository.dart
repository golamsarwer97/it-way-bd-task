import '../../data/model/task_add_request.dart';
import '../../data/model/task_add_response.dart';

abstract class TaskAddRepository {
  Future<TaskAddResponse> taskAdd(
    TaskAddRequest taskAddRequest,
  );
}
