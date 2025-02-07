import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../core/constant/api_constants.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../model/task_add_request.dart';
import '../model/task_add_response.dart';

abstract class TaskAddRemote {
  Future<TaskAddResponse> taskAdd(
    TaskAddRequest taskAddRequest,
  );
}

class TaskAddRemoteImpl implements TaskAddRemote {
  TaskAddRemoteImpl();

  @override
  Future<TaskAddResponse> taskAdd(TaskAddRequest taskAddRequest) async {
    var taskAddEndpoint = ApiConstants.baseUrl + ApiConstants.taskAdd;

    TaskAddResponse res;

    var header = {'Content-Type': 'application/json'};

    final response = await http.post(Uri.parse(taskAddEndpoint),
        body: json.encode(taskAddRequest), headers: header);

    log(json.encode(response.body));

    if (response.statusCode == 201) {
      res = taskAddResponseFromJson(response.body);
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
