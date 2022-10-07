// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:nf1005_firebase/domain/entities/task.dart';

abstract class TaskState extends Equatable {}

class InitialTaskState extends TaskState {
  @override
  List<Object?> get props => [];
}

class SuccessTaskState extends TaskState {
  List<Task> tasks;

  SuccessTaskState({
    required this.tasks,
  });
  
  @override
  List<Object?> get props => [tasks];
}

class ErrorTaskState extends TaskState {
  String message;
  ErrorTaskState({
    required this.message,
  });
  
  @override
  List<Object?> get props => [message];
}
