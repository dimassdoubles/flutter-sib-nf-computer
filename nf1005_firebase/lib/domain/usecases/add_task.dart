import 'package:nf1005_firebase/domain/repositories/task_repository.dart';

class AddTask {
  TaskRepository repository;

  AddTask({required this.repository});

  Future<void> call({required String task, required bool completed}) async {
    return await repository.addTask(task, completed);
  }
}
