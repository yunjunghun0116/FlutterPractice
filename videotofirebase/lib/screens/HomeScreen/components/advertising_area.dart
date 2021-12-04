import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreenAdvertisingArea extends StatelessWidget {
  const HomeScreenAdvertisingArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 300.0,
        viewportFraction: 1,
        autoPlay: true,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.amber),
              child: Text(
                'text $i',
                style: TextStyle(fontSize: 16.0),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
