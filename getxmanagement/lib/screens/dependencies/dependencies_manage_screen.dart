import 'package:flutter/material.dart';

class DependenciesManagePage extends StatelessWidget {
  const DependenciesManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의존성 주입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('의존성 주입'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('의존성 주입'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('의존성 주입'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('의존성 주입'),
            ),
          ],
        ),
      ),
    );
  }
}
