import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nf1005_firebase/data/datasources/task_remote_datasource.dart';
import 'package:nf1005_firebase/domain/entities/task.dart';

void main() async {
  final fakeFireStore = FakeFirebaseFirestore();
  final tasksCollection = fakeFireStore.collection('tasks');

  final task1 = tasksCollection.doc();
  await task1.set(
    {
      "id": task1.id,
      "task": "absen pagi nf computer",
      "completed": true,
    },
  );

  final task2 = tasksCollection.doc();
  await task2.set(
    {
      "id": task2.id,
      "task": "absen siang nf computer",
      "completed": false,
    },
  );

  TaskRemoteDataSource dataSource =
      TaskRemoteDataSourceImpl(firestore: fakeFireStore);

  test(
    'should return all task',
    () async {
      final result = await dataSource.getTasks();
      expect(result[0].task, "absen pagi nf computer");
    },
  );

  test(
    'should add new task',
    () async {
      await dataSource.addTask(
        task: "mengerjakan tugas firebase nf computer",
        completed: false,
      );

      final newCollection = await dataSource.getTasks();
      expect(newCollection[2].task, "mengerjakan tugas firebase nf computer");
    },
  );

  test(
    'should complete the task',
    () async {
      final result = await dataSource.getTasks();

      expect(result[1].completed, false);

      await dataSource.completeTheTask(id: result[1].id);
      final newResult = await dataSource.getTasks();

      expect(newResult[1].completed, true);
    },
  );
}
