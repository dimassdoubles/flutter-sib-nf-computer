// ignore_for_file: must_be_immutable

import "package:flutter/material.dart";
import 'package:nf1005_firebase/domain/entities/task.dart';
import 'package:nf1005_firebase/injections.dart';
import 'package:nf1005_firebase/presentation/bloc/task_bloc.dart';
import 'package:nf1005_firebase/presentation/bloc/task_event.dart';

class TaskItem extends StatelessWidget {
  Task task;
  TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => getIt<TaskBloc>().add(
        CompleteTaskEvent(
          taskToCompleted: task,
        ),
      ),
      title: Text(
        task.task,
        style: task.completed
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : const TextStyle(),
      ),
    );
  }
}
