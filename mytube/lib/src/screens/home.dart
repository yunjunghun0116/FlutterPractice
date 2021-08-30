import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mytube/src/components/app_custom_app_bar.dart';
import 'package:mytube/src/components/app_video_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: AppCustomAppBar(),
            //내릴때는 사라지지만, 스크롤을 올리면 AppBar가 보일수있도록 하는 기능
            floating: true,
            snap: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed('/detail/123');
                    },
                    child: AppVideoWidget(),
                  ),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
