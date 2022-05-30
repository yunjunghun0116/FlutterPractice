import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: key,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [],
              ),
            ),
            Row(),
          ],
        ),
      ),
    );
  }
}
