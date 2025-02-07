// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/task_update_status_request.dart';
import '../../data/model/task_update_status_response.dart';

import '../../domain/usecase/task_update_status_usecase.dart';

part 'task_update_status_state.dart';

class TaskUpdateStatusCubit extends Cubit<TaskUpdateStatusState> {
  final TaskUpdateStatusUsecase taskUpdateStatusUsecase;
  TaskUpdateStatusCubit({required this.taskUpdateStatusUsecase})
      : super(TaskUpdateStatusInitial());

  Future<void> taskUpdateStatus(
    String taskId,
    TaskUpdateStatusRequest taskUpdateStatusRequest,
  ) async {
    try {
      log('try');
      emit(TaskUpdateStatusLoading());
      final responseModel =
          await taskUpdateStatusUsecase(taskId, taskUpdateStatusRequest);
      emit(TaskUpdateStatusSuccess(taskUpdateStatusResponse: responseModel));
    } catch (ex, stackTrace) {
      print(ex);
      emit(TaskUpdateStatusFailure(ex, stackTrace));
    }
  }
}
