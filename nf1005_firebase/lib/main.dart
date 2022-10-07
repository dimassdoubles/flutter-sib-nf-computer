import 'package:flutter/material.dart';
import 'package:nf1005_firebase/presentation/pages/home_page.dart';
import 'package:nf1005_firebase/share/styles/themes.dart';
import 'injections.dart' as injections;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injections.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const HomePage(),
    );
  }
}
