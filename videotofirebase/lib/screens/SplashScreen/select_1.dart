import 'package:flutter/material.dart';

class Select1 extends StatelessWidget {
  final Function nextFunction;
  const Select1({Key? key, required this.nextFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [const Text('select1'),ElevatedButton(onPressed: (){nextFunction();}, child: Text('다음으로'))],
      ),
    );
  }
}
