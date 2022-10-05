import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nf1005_firebase/data/models/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> addTask({required String task, required bool completed});
  Future<void> completeTheTask({required String id});
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  static const String collectionName = "tasks";

  FirebaseFirestore firestore;

  TaskRemoteDataSourceImpl({required this.firestore});

  @override
  Future<List<TaskModel>> getTasks() async {
    CollectionReference tasks = firestore.collection(collectionName);
    final result = await tasks.get();

    final listTaskModel = result.docs
        .map(
          (e) => TaskModel(
            id: e.get("id"),
            task: e.get("task"),
            completed: e.get("completed"),
          ),
        )
        .toList();

    return listTaskModel;
  }

  @override
  Future<void> addTask({required String task, required bool completed}) async {
    final collection = firestore.collection(collectionName);
    final newtask = collection.doc();
    newtask.set(
      {
        "id": newtask.id,
        "task": task,
        "completed": completed,
      },
    );
  }

  @override
  Future<void> completeTheTask({required String id}) async {
    final collection = firestore.collection(collectionName);
    await collection.doc(id).update(
      {
        "completed": true,
      },
    );
  }
}
