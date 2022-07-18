import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text(
                '주문/배송 조회',
                style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.info_outline_rounded, color: Colors.black,))
            ],

            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          body: orderBody(),
        )
    );
  }

  orderBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MaterialButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text('기간|전체'),
                  Icon(Icons.arrow_drop_down, color: Colors.black26,)
                ],
              ),
            )
          ],
        ),
        orderList()
      ],
    );
  }

  orderList() {
    return Align(
        alignment: Alignment.center,
        child: Container(
          width: 350,
          height: 80,
          color: Color(0xFFEEEEEE), //light grey
          child: TextButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                orderTitle('결제/입금'),
                orderTitle('배송중'),
                orderTitle('배송완료'),
                orderTitle('주문취소'),
                orderTitle('교환/반품'),
              ],
            ),
          ),

        )
    );
  }

  orderTitle(String s) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('0', style: TextStyle(color: Colors.black12, fontSize: 21)),
        Text(s, style: TextStyle(color: Colors.black87, fontSize: 11),)
      ],
    );
  }
}
