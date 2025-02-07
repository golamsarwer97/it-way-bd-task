part of 'task_update_status_cubit.dart';

abstract class TaskUpdateStatusState extends Equatable {
  const TaskUpdateStatusState();

  @override
  List<Object> get props => [];
}

class TaskUpdateStatusInitial extends TaskUpdateStatusState {}

class TaskUpdateStatusLoading extends TaskUpdateStatusState {}

class TaskUpdateStatusSuccess extends TaskUpdateStatusState {
  final TaskUpdateStatusResponse taskUpdateStatusResponse;
  const TaskUpdateStatusSuccess({required this.taskUpdateStatusResponse});
}

class TaskUpdateStatusFailure extends TaskUpdateStatusState {
  final StackTrace stackTrace;
  final Object exception;

  const TaskUpdateStatusFailure(
    this.exception,
    this.stackTrace,
  );
}
