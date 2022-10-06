import 'package:nf1005_firebase/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(String task, bool completed);
  Future<void> completeTask(String id);
}
