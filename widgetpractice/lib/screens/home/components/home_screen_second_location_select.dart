import 'package:flutter/material.dart';

class HomeScreenSecondLocationSelect extends StatelessWidget {
  final Function onPressed;
  final List<String> list;
  const HomeScreenSecondLocationSelect({Key? key, required this.list, required this.onPressed,})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width) * 2 / 3,
      child: SingleChildScrollView(
        child: Column(
          children: list.map((String location) {
            return InkWell(
              onTap: (){
                onPressed(location);
              },
              child: Container(
                height: 70,
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
