import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nf1005_firebase/domain/entities/task.dart';
import 'package:nf1005_firebase/domain/repositories/task_repository.dart';
import 'package:nf1005_firebase/domain/usecases/get_tasks.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  final mockRepository = MockTaskRepository();
  final usecase = GetTasks(repository: mockRepository);

  List<Task> tasks = [
    Task(id: "ajrfiawerhtf", task: 'absen pagi nf computer', completed: true),
    Task(id: "ahdfuihadflk", task: 'absen siang nf computer', completed: false),
  ];

  test(
    'should return Task',
    () async {
      when(
        () => mockRepository.getTasks(),
      ).thenAnswer(
        (invocation) async => tasks,
      );

      final result = await usecase();
      verify(() => mockRepository.getTasks());

      expect(result, tasks);
    },
  );
}
