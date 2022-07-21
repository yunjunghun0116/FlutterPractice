import 'package:app/components/view/navigation_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PointPage extends StatefulWidget {
  const PointPage({Key? key}) : super(key: key);

  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          appBar: NavigationBarView(
              title: '포인트'
          ),
          body: Column(
            children: [
              SizedBox(height: 20,),
              pointList(),
              Row(
                children: [
                  MaterialButton(onPressed: (){
                    filterSheet();
                  },
                    child: Row(
                      children: [
                        Image.asset("images/ic_filter.png"),
                        Text('필터')
                      ],
                    ),),
                  Spacer(),
                  MaterialButton(onPressed: (){
                    pointSheet();
                  },
                    child: Row(
                      children: [
                        Text('전체'),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),)
                ],
              )
            ],
          ),
        ));
  }

  pointList() {
    return Container(
      alignment: Alignment.topCenter,
      width: 340,
      height: 88,
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex:1,child: Row(
            children: [
              Text('  사용 가능 포인트', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
              Spacer(),
              Text('0p  ',style: TextStyle(color: Color(0xFFb4875e)), ),
            ],
          ),),
          Divider(thickness: 0.5,color: Colors.white10,),
          Expanded(flex: 1,child: Row(
            children: [
              Text('  소멸 예정(1개월내)',style: TextStyle(fontSize:13 ,color: Colors.grey),),
              Spacer(),
              TextButton(onPressed: (){},
                  child: Text('조회하기> ', style: TextStyle(fontSize:13,color: Colors.grey, fontWeight: FontWeight.bold),))
            ],
          ),)
        ],
      ),
    );
  }

  void filterSheet() {

  }

  void pointSheet() {}
}
