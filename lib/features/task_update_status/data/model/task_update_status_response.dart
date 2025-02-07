// To parse this JSON data, do
//
//     final taskUpdateStatusResponse = taskUpdateStatusResponseFromJson(jsonString);

import 'dart:convert';

TaskUpdateStatusResponse taskUpdateStatusResponseFromJson(String str) =>
    TaskUpdateStatusResponse.fromJson(json.decode(str));

String taskUpdateStatusResponseToJson(TaskUpdateStatusResponse data) =>
    json.encode(data.toJson());

class TaskUpdateStatusResponse {
  int id;
  String todo;
  bool completed;
  int userId;

  TaskUpdateStatusResponse({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory TaskUpdateStatusResponse.fromJson(Map<String, dynamic> json) =>
      TaskUpdateStatusResponse(
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
