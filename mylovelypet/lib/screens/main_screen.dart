import 'package:flutter/material.dart';
import 'package:mypetmoments/components/feed_time_component.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  initState() {
    super.initState();
  }

  Widget _feedTimeArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.7),
      ),
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(100, (index) {
            return FeedTimeComponent('$index일 1시 2분', '$index일 9시 2분');
          }),
        ),
      ),
    );
  }

  Widget _petImageArea() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.withOpacity(0.7),
      ),
      height: 400,
      child: GridView.count(
        crossAxisCount: 3,
        children: List.generate(30, (index) {
          return Center(
            child: Text('item $index'),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _feedTimeArea(),
              _petImageArea(),
            ],
          ),
        ),
      ),
    );
  }
}
