import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselArea extends StatelessWidget {
  const CarouselArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 3,
        ),
      ),
      items: [
        'assets/images/image_1.jpeg',
        'assets/images/image_2.jpeg',
        'assets/images/image_3.jpeg',
      ].map((String address) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    address,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
