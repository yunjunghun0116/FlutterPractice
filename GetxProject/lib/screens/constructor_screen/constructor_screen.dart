import 'package:flutter/material.dart';

class ConstructorScreen extends StatelessWidget {
  final String name;
  final int age;
  const ConstructorScreen({
    Key? key,
    required this.name,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(name);
    print(age);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name),
            Text('$age 살'),
          ],
        ),
      ),
    );
  }
}
