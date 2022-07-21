import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/enum/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CouponPage extends StatelessWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: NavigationBarView(
              title: '보유폰 쿠폰',
              buttonTypes: const [
                NavigationButtonType.information
              ]
          ),
          body: couponList(),

    )
    );
  }

  couponList() {
    return Column(
      children: [
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text('사용가능'),
           MaterialButton(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: const [
                   Text("최근순"),
                   Icon(Icons.arrow_drop_down)
                 ],
               ),
               onPressed: () {
                 couponBottomSheet();
               })
         ],
       )
      ],
    );
  }

  void couponBottomSheet() {
    Get.bottomSheet(
        SizedBox(height: 200,
          child: ListView(
            children: [
              MaterialButton(onPressed: (){},
              child: Text('최근순'),),
              MaterialButton(onPressed: (){},
                child: Text('마감순'),),
              MaterialButton(onPressed: (){Get.back();},
                child: Text('취소'),)
            ],
          ),
        ),
      backgroundColor: Colors.white,
      elevation: 0
    );
  }
}
