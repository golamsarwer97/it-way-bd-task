import '../../data/model/task_list_response.dart';
import '../repository/task_list_repository.dart';

class TaskListUsecase {
  final TaskListRepository _taskListRepository;

  TaskListUsecase(this._taskListRepository);

  Future<TaskListResponse> call() => _taskListRepository.taskList();
}
