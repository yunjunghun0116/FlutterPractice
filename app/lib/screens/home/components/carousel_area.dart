import 'package:app/models/home/event_banner.dart';
import 'package:app/utils/network_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselArea extends StatelessWidget {
  const CarouselArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: NetworkUtils().getBanner(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<EventBanner> eventBannerList = snapshot.data;
            return CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(
                  seconds: 3,
                ),
              ),
              items: eventBannerList.map((eventBanner) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(eventBanner.homeBannerImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }).toList(),
            );
          }
          return Container();
        });
  }
}
