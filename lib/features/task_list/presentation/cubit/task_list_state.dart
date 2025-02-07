part of 'task_list_cubit.dart';

abstract class TaskListState extends Equatable {
  const TaskListState();

  @override
  List<Object> get props => [];
}

class TaskListInitial extends TaskListState {}

class TaskListLoading extends TaskListState {}

class TaskListSuccess extends TaskListState {
  final TaskListResponse taskListResponse;
  const TaskListSuccess({required this.taskListResponse});
}

class TaskListFailure extends TaskListState {
  final StackTrace stackTrace;

  // final TimberTreesResponse timberTreesResponse;
  final Object exception;

  const TaskListFailure(
    this.exception,
    this.stackTrace,
  );
}
