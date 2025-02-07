import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../core/constant/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../model/task_list_response.dart';

abstract class TaskListRemote {
  Future<TaskListResponse> taskList();
}

class TaskListRemoteImpl implements TaskListRemote {
  TaskListRemoteImpl();

  @override
  Future<TaskListResponse> taskList() async {
    var taskListEndpoint = ApiConstants.baseUrl + ApiConstants.taskList;
    TaskListResponse res;

    final response = await http.get(Uri.parse(taskListEndpoint));
    log(json.encode(response.body));
    if (response.statusCode == 200) {
      res = taskListResponseFromJson(response.body);
      return res;
    } else {
      print("in error");
      final errorBody = jsonDecode(response.body);
      final errorMessage = errorBody['error'];
      log("errorMessage ::::  ${json.encode(errorMessage)}");

      throw ServerException(
        message: errorMessage,
        statusCode: response.statusCode,
      );
    }
  }
}
