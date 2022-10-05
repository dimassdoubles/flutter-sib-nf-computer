import 'package:nf1005_firebase/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class GetTasks {
  TaskRepository repository;

  GetTasks({required this.repository});

  Future<List<Task>> call() async {
    return await repository.getTasks();
  }
}
