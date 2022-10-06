import '../../domain/entities/task.dart';

abstract class TaskEvent {}

class GetTaskEvent extends TaskEvent {}

class AddTaskEvent extends TaskEvent {
  String task;
  bool completed;

  AddTaskEvent({required this.task, required this.completed});
}

class CompleteTaskEvent extends TaskEvent {
  Task taskToCompleted;

  CompleteTaskEvent({required this.taskToCompleted});
}
