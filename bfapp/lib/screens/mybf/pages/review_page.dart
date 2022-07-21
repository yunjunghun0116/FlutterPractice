import 'package:app/components/view/navigation_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants_color.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: NavigationBarView(
              title: '이용후기'
          ),
          body: Column(
            children: [
              TabBar(
                  labelPadding: EdgeInsets.only(top: 20),
                  controller: _tabController,
                  indicatorColor: kBfb4875eColor,
                  labelColor: kBfb4875eColor,
                  unselectedLabelColor: Colors.grey[400],
                  tabs: const [
                    SizedBox(height: 40,
                        child: Text("이용후기 쓰기")),
                    SizedBox(height: 40,
                        child: Text("내 이용후기"))
                  ]
              ),
            ],
          ),
    ));
  }
}
