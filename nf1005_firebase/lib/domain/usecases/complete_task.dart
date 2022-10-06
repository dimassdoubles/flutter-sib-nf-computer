import 'package:nf1005_firebase/domain/repositories/task_repository.dart';

class CompleteTask {
  TaskRepository repository;

  CompleteTask({required this.repository});

  Future<void> call({required String id}) async {
    return await repository.completeTask(id);
  }
}
