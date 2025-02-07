import '../../data/model/task_list_response.dart';

abstract class TaskListRepository {
  Future<TaskListResponse> taskList();
}
