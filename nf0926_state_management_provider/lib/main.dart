import 'package:flutter/material.dart';
import 'package:nf0926_state_management_provider/change_notifier/color_change.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ColorChange>(
      create: (context) => ColorChange(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<ColorChange>(
                  builder: (context, value, child) => Text(
                    'Hello World!',
                    style: TextStyle(
                      color: value.isColorChange ? Colors.blue : Colors.red,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Consumer<ColorChange>(
                  builder: (context, notifier, child) => Switch(
                    value: notifier.isColorChange,
                    onChanged: (value) {
                      notifier.changeColor();
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
