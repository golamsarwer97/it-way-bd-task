import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:todo_app/features/task_update_status/data/model/task_update_status_request.dart';

import '../../../../core/constant/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../model/task_update_status_response.dart';

abstract class TaskUpdateStatusRemote {
  Future<TaskUpdateStatusResponse> taskUpdateStatus(
    String taskId,
    TaskUpdateStatusRequest taskUpdateStatusRequest,
  );
}

class TaskUpdateStatusRemoteImpl implements TaskUpdateStatusRemote {
  TaskUpdateStatusRemoteImpl();

  @override
  Future<TaskUpdateStatusResponse> taskUpdateStatus(
    String taskId,
    TaskUpdateStatusRequest taskUpdateStatusRequest,
  ) async {
    var taskUpdateStatusEndpoint =
        ApiConstants.baseUrl + ApiConstants.taskUpdateStatus + "${taskId}";

    TaskUpdateStatusResponse res;

    var header = {'Content-Type': 'application/json'};

    final response = await http.put(Uri.parse(taskUpdateStatusEndpoint),
        body: json.encode(taskUpdateStatusRequest), headers: header);

    log(json.encode(response.body));

    if (response.statusCode == 200) {
      res = taskUpdateStatusResponseFromJson(response.body);
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
