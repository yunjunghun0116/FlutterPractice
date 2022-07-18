import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);


  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

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
                  '서비스 접수',
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
                    child: Text('접수하기', style: const TextStyle(color: Color(0xFFb4875e)),),
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
