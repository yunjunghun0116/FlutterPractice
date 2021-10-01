import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mypetmoments/components/constants.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var momentData = Get.arguments;

  Widget _momentImage(String url) {
    if(url == noImageUrl){
      return Container();
    }
    else{
      return Container(
        child: Center(
          child: Image.network(
            url,
          ),
        ),
      );
    }
  }

  Widget _momentComment(String comment) {
    return Container(
      child: SingleChildScrollView(
        child: Text(comment),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(momentData);
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
