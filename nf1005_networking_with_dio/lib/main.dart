import 'package:flutter/material.dart';
import 'package:tugas_networking/pages/home_page.dart';
import 'injections.dart' as injection;

void main() async {
  await injection.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
