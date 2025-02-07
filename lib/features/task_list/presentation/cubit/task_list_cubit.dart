// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/task_list_response.dart';
import '../../domain/usecase/task_list_usecase.dart';

part 'task_list_state.dart';

class TaskListCubit extends Cubit<TaskListState> {
  final TaskListUsecase taskListUsecase;
  TaskListCubit({required this.taskListUsecase}) : super(TaskListInitial());

  Future<void> taskList() async {
    try {
      log('try');
      emit(TaskListLoading());
      final responseModel = await taskListUsecase();
      emit(TaskListSuccess(taskListResponse: responseModel));
    } catch (ex, stackTrace) {
      print(ex);
      emit(TaskListFailure(ex, stackTrace));
    }
  }
}
