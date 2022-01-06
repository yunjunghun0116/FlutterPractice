import 'package:flutter/material.dart';
import 'package:widgetpractice/constants.dart';

class HomeScreenFirstLocationSelect extends StatelessWidget {
  final int currentIndex;
  final List<String> list;
  const HomeScreenFirstLocationSelect({
    Key? key,
    required this.list,
    required this.currentIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int i = 0;
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: SingleChildScrollView(
        child: Column(
          children: list.map((String location) {
            int _index = i;
            return GestureDetector(
              onTap: (){
                if(currentIndex != _index){
                  print('서비스지역아님');
                }
              },
              child: Container(
                height: 70,
                color: currentIndex == i++?kWhiteColor:Colors.grey,
                alignment: Alignment.center,
                child: Text(location),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
