import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var momentData = Get.arguments;


  Widget _momentImage(String url){
    return Container(
      child: Image.asset(url),
    );
  }

  Widget _momentComment(String comment){
    return Container(
      child: SingleChildScrollView(
        child: Text(comment),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _momentImage(momentData['imageUrl']),
              _momentComment(momentData['comment']),
            ],
          ),
        ),
      ),
    );
  }
}
