import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int radioVal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SecondScreen')),
      body: Column(
        children: [
          Row(
            children: [
              Radio(
                groupValue: radioVal,
                value: 0,
                onChanged: (value) {
                  setState(() {
                    radioVal = value as int;
                  });
                },
              ),
              const Text('0'),
            ],
          ),
          Row(
            children: [
              Radio(
                groupValue: radioVal,
                value: 1,
                onChanged: (value) {
                  setState(() {
                    radioVal = value as int;
                  });
                },
              ),
              const Text('1'),
            ],
          ),
          Row(
            children: [
              Radio(
                groupValue: radioVal,
                value: 2,
                onChanged: (value) {
                  setState(() {
                    radioVal = value as int;
                  });
                },
              ),
              const Text('2'),
            ],
          ),
          Text('radioVal : $radioVal'),
          ElevatedButton(
            onPressed: () {
              Get.back(result: radioVal);
            },
            child: const Text('뒤로가기'),
          ),
        ],
      ),
    );
  }
}
