// To parse this JSON data, do
//
//     final taskUpdateStatusRequest = taskUpdateStatusRequestFromJson(jsonString);

import 'dart:convert';

TaskUpdateStatusRequest taskUpdateStatusRequestFromJson(String str) =>
    TaskUpdateStatusRequest.fromJson(json.decode(str));

String taskUpdateStatusRequestToJson(TaskUpdateStatusRequest data) =>
    json.encode(data.toJson());

class TaskUpdateStatusRequest {
  bool completed;

  TaskUpdateStatusRequest({
    required this.completed,
  });

  factory TaskUpdateStatusRequest.fromJson(Map<String, dynamic> json) =>
      TaskUpdateStatusRequest(
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "completed": completed,
      };
}
