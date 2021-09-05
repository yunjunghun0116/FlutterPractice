import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatelessWidget {
  final String message;
  ErrorScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            message,
            style: TextStyle(
              fontSize: 48.0,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            child: GestureDetector(
              onTap: (){
                print('goClicked');
                Get.toNamed('/');
              },
              child: Container(
                margin: EdgeInsets.only(top: 60.0),
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40,),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Text('재연결'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
