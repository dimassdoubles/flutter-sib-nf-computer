import 'package:bloc/bloc.dart';
import 'package:nf1005_firebase/domain/usecases/add_task.dart';
import 'package:nf1005_firebase/domain/usecases/complete_task.dart';
import 'package:nf1005_firebase/domain/usecases/get_tasks.dart';
import 'package:nf1005_firebase/presentation/bloc/task_event.dart';
import 'package:nf1005_firebase/presentation/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  GetTasks getTasks;
  AddTask addTask;
  CompleteTask completeTask;

  TaskBloc({
    required this.getTasks,
    required this.addTask,
    required this.completeTask,
  }) : super(
          InitialTaskState(),
        ) {
    on<GetTaskEvent>(
      (event, emit) async {
        try {
          final result = await getTasks();
          emit(
            SuccessTaskState(tasks: result),
          );
        } catch (e) {
          emit(
            ErrorTaskState(message: "Maaf, terjadi Error"),
          );
        }
      },
    );
    on<AddTaskEvent>(
      (event, emit) async {
        try {
          await addTask(
            task: event.task,
            completed: event.completed,
          );

          final newTasks = await getTasks();
          emit(
            SuccessTaskState(tasks: newTasks),
          );
        } catch (e) {
          emit(
            ErrorTaskState(message: "Maaf, terjadi Error"),
          );
        }
      },
    );
    on<CompleteTaskEvent>(
      (event, emit) async {
        try {
          await completeTask(id: event.taskToCompleted.id);

          final newTasks = await getTasks();
          emit(
            SuccessTaskState(tasks: newTasks),
          );
        } catch (e) {
          emit(
            ErrorTaskState(message: "Maaf, terjadi Error"),
          );
        }
      },
    );
  }
}
