// To parse this JSON data, do
//
//     final taskAddRequest = taskAddRequestFromJson(jsonString);

import 'dart:convert';

TaskAddRequest taskAddRequestFromJson(String str) =>
    TaskAddRequest.fromJson(json.decode(str));

String taskAddRequestToJson(TaskAddRequest data) => json.encode(data.toJson());

class TaskAddRequest {
  String todo;
  bool completed;
  int userId;

  TaskAddRequest({
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TaskAddRequest.fromJson(Map<String, dynamic> json) => TaskAddRequest(
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
