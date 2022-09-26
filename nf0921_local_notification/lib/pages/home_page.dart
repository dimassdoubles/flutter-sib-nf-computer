import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // local notification
            ElevatedButton(
              onPressed: () {},
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text('Show Local Notification'),
                ),
              ),
            ),

            // scheduled notification
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text('Show Scheduled Notification'),
                ),
              ),
            ),

            // notification with payload
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text('Show Notification With Payloads'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
