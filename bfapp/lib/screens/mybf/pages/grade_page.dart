import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradePage extends StatefulWidget {
  const GradePage({Key? key}) : super(key: key);

  @override
  _GradePageState createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: NavigationBarView(
              title: '등급 안내',
            type: NavigationType.close
          ),
        ));
  }
}
