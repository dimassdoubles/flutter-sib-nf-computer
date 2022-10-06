import 'package:nf1005_firebase/data/datasources/task_remote_datasource.dart';
import 'package:nf1005_firebase/domain/entities/task.dart';
import 'package:nf1005_firebase/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskRemoteDataSource remoteDataSource;

  TaskRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addTask(String task, bool completed) async {
    return await remoteDataSource.addTask(task: task, completed: completed);
  }

  @override
  Future<void> completeTask(String id) async {
    return await remoteDataSource.completeTheTask(id: id);
  }

  @override
  Future<List<Task>> getTasks() async {
    return await remoteDataSource.getTasks();
  }
}
