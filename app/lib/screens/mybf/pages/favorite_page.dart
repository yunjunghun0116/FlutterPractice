import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
            '관심상품',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black)),

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
      body:favoriteList(),
    )
    );
  }

  favoriteList() {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('   전체'),
                OutlinedButton(
                    onPressed: (){},
                    child: Text('전체삭제', style:TextStyle(color: Colors.black),)),
              ],
            )
          ],
        )
      ],
    );
  }
}
