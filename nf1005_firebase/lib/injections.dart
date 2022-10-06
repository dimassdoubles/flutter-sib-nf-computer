import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:nf1005_firebase/data/datasources/task_remote_datasource.dart';
import 'package:nf1005_firebase/data/repositories/task_repository_impl.dart';
import 'package:nf1005_firebase/domain/repositories/task_repository.dart';
import 'package:nf1005_firebase/domain/usecases/add_task.dart';
import 'package:nf1005_firebase/domain/usecases/complete_task.dart';
import 'package:nf1005_firebase/domain/usecases/get_tasks.dart';
import 'package:nf1005_firebase/firebase_options.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final firestore = FirebaseFirestore.instance;

  getIt.registerSingleton<TaskRemoteDataSource>(
    TaskRemoteDataSourceImpl(firestore: firestore),
  );
  getIt.registerSingleton<TaskRepository>(
    TaskRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => GetTasks(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => AddTask(
      repository: getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => CompleteTask(
      repository: getIt(),
    ),
  );
}
