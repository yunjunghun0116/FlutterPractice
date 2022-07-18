import 'package:animated_button_bar/animated_button_bar.dart';
import 'package:app/models/mybf/issue_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class CustomerAskPage extends StatefulWidget {
  const CustomerAskPage({Key? key}) : super(key: key);


  @override
  _CustomerAskPageState createState() => _CustomerAskPageState();
}

class _CustomerAskPageState extends State<CustomerAskPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool openCategoryChange = false;
  bool openManualCategoryChange = false;

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text(
              '1:1문의',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            color: Colors.black)
            ),

            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: (){
                Get.back();
              },
            ),
          ),
          body:Container(
            alignment: Alignment.topCenter,
              child:Column(
                children: [
                  const SizedBox(height: 10,),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFb4875e),),
                        minimumSize: const Size(
                          350.0,
                          35.0
                        ),
                      ),
                    onPressed: (){},
                    child: Text('문의하기', style: const TextStyle(color: Color(0xFFb4875e)),),
                  ),

                  const Divider(thickness: 3.0,),
              DefaultTabController(
                  length: 4,
                  child:Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.all(8.0),),
                          Material(
                            child: TabBar(
                              unselectedLabelColor: Colors.black54,
                              indicatorColor: Colors.white,
                              indicator: RectangularIndicator(
                                bottomLeftRadius: 100,
                                bottomRightRadius: 100,
                                topRightRadius: 100,
                                topLeftRadius: 100,
                                paintingStyle: PaintingStyle.fill,
                                color: Colors.white
                              ),
                              tabs: [
                                Tab(text: '1개월'),
                                Tab(text: '3개월'),
                                Tab(text: '6개월'),
                                Tab(text: '전체'),
                            ],
                              labelColor: Colors.black
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              )
            ],
          ),
        )
        )
    );
  }
}
