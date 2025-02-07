part of 'task_add_cubit.dart';

abstract class TaskAddState extends Equatable {
  const TaskAddState();

  @override
  List<Object> get props => [];
}

class TaskAddInitial extends TaskAddState {}

class TaskAddLoading extends TaskAddState {}

class TaskAddSuccess extends TaskAddState {
  final TaskAddResponse taskAddResponse;
  const TaskAddSuccess({required this.taskAddResponse});
}

class TaskAddFailure extends TaskAddState {
  final StackTrace stackTrace;
  final Object exception;

  const TaskAddFailure(
    this.exception,
    this.stackTrace,
  );
}
