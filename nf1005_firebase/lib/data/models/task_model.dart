import '../../domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({required super.id, required super.task, required super.completed});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          task: json['task'],
          completed: json['completed'],
        );

  Map<String, dynamic> toJson() {
    return {
      "task": task,
      "completed": completed,
    };
  }
}
