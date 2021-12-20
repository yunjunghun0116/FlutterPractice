import 'package:flutter/material.dart';
import 'package:widgetpractice/screens/GoogleMapPractice/google_map_practice.dart';

class CustomScrollViewPracitce extends StatelessWidget {
  const CustomScrollViewPracitce({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.red,
            ),
          ),
          SliverAppBar(
            backgroundColor: Colors.white,
            // floating : true -> 내릴때 보여줄거냐 와같은문제
            pinned: true,
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Image.asset(
            //     'assets/images/ad_image_1.jpeg',
            //     fit: BoxFit.fill,
            //   ),
            //   title: const Text(
            //     'SliverAppBar',
            //     style: TextStyle(color: Colors.black),
            //   ),
            //   stretchModes: const [
            //     StretchMode.zoomBackground,
            //     StretchMode.fadeTitle,
            //   ],
            // ),
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text('추천순',style: TextStyle(
                          color: Colors.black,
                        ),),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text('추천순',style: TextStyle(
                          color: Colors.black,
                        ),),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text('추천순',style: TextStyle(
                          color: Colors.black,
                        ),),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text('추천순',style: TextStyle(
                          color: Colors.black,
                        ),),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Text('추천순',style: TextStyle(
                          color: Colors.black,
                        ),),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50, //각각의 높이
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const GoogleMapPractice();
                    }));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.purple[100 * (index % 9 + 1)],
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
