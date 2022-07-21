import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/constants_color.dart';


class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarView(
          title: '장바구니'
      ),
      body: SafeArea(
        child: Stack(
          children: [
            MaterialButton(
              color: kbtnLightGreyColor,
              onPressed: (){
                // fetch();
              },
              child: const Text('구매하기', style: TextStyle(color: Colors.white),),),
            Center(
              child: Text("장바구니에 담긴 상품이 없습니다."),
            ),
          ],
        ),
      ),
    );
  }

  // Future<ShoppingDetailData?> _fetch() async {
  //   // await Future.delayed(const Duration(milliseconds: 50));
  //   data = await NetworkUtils().getShoppingDetailInfo(
  //       argument!.id!);
  //   getController.saveShoppingDetailInfo(data);
  //   return data;
  // }

  fetch()async{
    var a = await NetworkUtils().getMyCart(58490);
  }

}
