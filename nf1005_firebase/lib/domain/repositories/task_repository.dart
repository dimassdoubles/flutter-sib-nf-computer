import 'package:nf1005_firebase/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<void> addTask(Task task);
  Future<void> deleteTask(Task task);
  Future<void> updateTask(Task task);
}
