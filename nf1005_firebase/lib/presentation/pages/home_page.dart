// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nf1005_firebase/presentation/bloc/task_bloc.dart';
import 'package:nf1005_firebase/presentation/bloc/task_event.dart';
import 'package:nf1005_firebase/share/styles/themes.dart';

import '../../domain/entities/task.dart';
import '../../injections.dart';
import '../bloc/task_state.dart';
import '../widgets/task_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskBloc taskBloc = getIt<TaskBloc>();
    taskBloc.add(
      GetTaskEvent(),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text(
                'Add Task',
              ),
              content: TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                onSubmitted: (value) {
                  getIt<TaskBloc>().add(
                    AddTaskEvent(
                      task: value,
                      completed: false,
                    ),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
        child: const Icon(Icons.add_rounded),
      ),
      body: Center(
        child: BlocBuilder<TaskBloc, TaskState>(
          bloc: taskBloc,
          builder: (context, state) {
            if (state is SuccessTaskState) {
              return HomeContent(tasks: state.tasks);
            } else if (state is ErrorTaskState) {
              return Text(state.message);
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  List<Task> tasks;
  HomeContent({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        children: [
          Text(
            "What's up, Dimas!",
            style: textStyle1.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text("ALL TASKS"),
          const SizedBox(
            height: 8,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: tasks.length,
            itemBuilder: (context, index) => TaskItem(
              task: tasks[index],
            ),
          ),
        ],
      ),
    );
  }
}
