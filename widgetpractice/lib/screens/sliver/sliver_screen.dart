import 'package:flutter/material.dart';

class CustomScrollViewPractice extends StatelessWidget {
  const CustomScrollViewPractice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 300,
              color: Colors.red,
              child: const Text('광고 or 지도와같은기능이 들어갈 박스'),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            backgroundColor: Colors.white,
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
                      children: const [
                        Text('추천순',style: TextStyle(
                          color: Colors.black,
                        ),),
                        Icon(Icons.arrow_drop_down),
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
                      children: const [
                        Text('추천순',style: TextStyle(
                          color: Colors.black,
                        ),),
                        Icon(Icons.arrow_drop_down),
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
                return Container(
                  alignment: Alignment.center,
                  color: Colors.purple[100 * (index % 9 + 1)],
                  child: Text(
                    'List Item $index',
                    style: const TextStyle(fontSize: 20),
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
