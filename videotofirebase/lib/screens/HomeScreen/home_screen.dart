import 'package:flutter/material.dart';
import 'components/advertising_area.dart';
import 'components/recommend_artist_area.dart';
import 'components/top_category_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCategoryIndex = 0;

  Widget _getMainArea() {
    if (_currentCategoryIndex == 0) {
      return Column(
        children: const [
          HomeScreenAdvertisingArea(),
          RecommendArtistArea(),
        ],
      );
    } else if(_currentCategoryIndex == 1){
      return Column(
        children: const [
        ],
      );
    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              HomeScreenTopCategoryContainer(
                onTapFunction: () {
                  setState(() {
                    _currentCategoryIndex = 0;
                  });
                },
                categoryTitle: '홈',
                currentCategoryIndex: _currentCategoryIndex,
                categoryIndex: 0,
              ),
              HomeScreenTopCategoryContainer(
                onTapFunction: () {
                  setState(() {
                    _currentCategoryIndex = 1;
                  });
                },
                categoryTitle: '내 주변',
                currentCategoryIndex: _currentCategoryIndex,
                categoryIndex: 1,
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(child: _getMainArea()),
          )
        ],
      ),
    );
  }
}
