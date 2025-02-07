// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/task_add_request.dart';
import '../../data/model/task_add_response.dart';
import '../../domain/usecase/task_add_usecase.dart';

part 'task_add_state.dart';

class TaskAddCubit extends Cubit<TaskAddState> {
  final TaskAddUsecase taskAddUsecase;
  TaskAddCubit({required this.taskAddUsecase}) : super(TaskAddInitial());

  Future<void> taskAdd(
    TaskAddRequest taskAddRequest,
  ) async {
    try {
      log('try');
      emit(TaskAddLoading());
      final responseModel = await taskAddUsecase(taskAddRequest);
      emit(TaskAddSuccess(taskAddResponse: responseModel));
    } catch (ex, stackTrace) {
      print(ex);
      emit(TaskAddFailure(ex, stackTrace));
    }
  }
}
