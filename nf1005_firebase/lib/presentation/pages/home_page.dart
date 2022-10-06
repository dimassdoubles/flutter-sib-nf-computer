import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nf1005_firebase/presentation/bloc/task_bloc.dart';
import 'package:nf1005_firebase/presentation/bloc/task_event.dart';

import '../../injections.dart';
import '../bloc/task_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskBloc taskBloc = getIt<TaskBloc>();
    taskBloc.add(
      GetTaskEvent(),
    );

    return Scaffold(
      body: Center(
        child: BlocBuilder<TaskBloc, TaskState>(
          bloc: taskBloc,
          builder: (context, state) {
            if (state is InitialTaskState) {
              return const CircularProgressIndicator();
            } else if (state is SuccessTaskState) {
              return ListView.builder(
                itemCount: state.tasks.length,
                itemBuilder: (context, index) => Text(state.tasks[index].task),
              );
            } else if (state is ErrorTaskState) {
              return Text(state.message);
            } else {
              return const Text("Hello World!");
            }
          },
        ),
      ),
    );
  }
}
