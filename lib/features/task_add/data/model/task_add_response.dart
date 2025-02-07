// To parse this JSON data, do
//
//     final taskAddResponse = taskAddResponseFromJson(jsonString);

import 'dart:convert';

TaskAddResponse taskAddResponseFromJson(String str) =>
    TaskAddResponse.fromJson(json.decode(str));

String taskAddResponseToJson(TaskAddResponse data) =>
    json.encode(data.toJson());

class TaskAddResponse {
  int id;
  String todo;
  bool completed;
  int userId;

  TaskAddResponse({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TaskAddResponse.fromJson(Map<String, dynamic> json) =>
      TaskAddResponse(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
