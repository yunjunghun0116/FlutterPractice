import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselImageArea extends StatelessWidget {
  final List imageList;

  const CarouselImageArea({Key? key, required this.imageList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width,
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(
          seconds: 3,
        ),
      ),
      items: imageList.map((chairImageUrl) {
        return Image.network(
          chairImageUrl,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
        );
      }).toList(),
    );
  }
}
