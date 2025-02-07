import '../../data/model/task_add_request.dart';
import '../../data/model/task_add_response.dart';
import '../repository/task_add_repository.dart';

class TaskAddUsecase {
  final TaskAddRepository _taskAddRepository;

  TaskAddUsecase(this._taskAddRepository);

  Future<TaskAddResponse> call(TaskAddRequest taskAddRequest) =>
      _taskAddRepository.taskAdd(taskAddRequest);
}
