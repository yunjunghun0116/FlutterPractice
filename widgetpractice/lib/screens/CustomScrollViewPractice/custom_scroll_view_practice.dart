import 'package:flutter/material.dart';
import 'package:widgetpractice/screens/GoogleMapPractice/google_map_practice.dart';

class CustomScrollViewPracitce extends StatelessWidget {
  const CustomScrollViewPracitce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            expandedHeight: 70,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/ad_image_1.jpeg',
                fit: BoxFit.fill,
              ),
              title: const Text(
                'SliverAppBar',
                style: TextStyle(color: Colors.black),
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
              ],
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50,//각각의 높이
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return const GoogleMapPractice();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.purple[100 * (index % 9+1)],
                    child: Text(
                      'List Item $index',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
