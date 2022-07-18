import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/constants_color.dart';
import '../../../icon.dart';
import '../../../models/shopping/shopping_list_model.dart';
import '../../../utils/format_utils.dart';

class ProductListItem{

  Widget showListItem(List<Content>? content, int index){
    return InkWell(
        onTap: (){
          Get.toNamed('/shoppingDetailScreen', arguments: content![index]);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  AspectRatio(aspectRatio: 1/1,child: Image.network(content![index].listImage.toString(), fit: BoxFit.cover,),),
                  Positioned(bottom: 10, right: 10, child: InkWell(onTap: (){}, child: Image.asset(icLikeUnselected, width: 25,),)),
                  content[index].soldout == true ? AspectRatio(aspectRatio: 1/1, child: Container(
                    color: Colors.black.withOpacity(0.4),
                    child: Center(child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white24.withOpacity(0.3)
                      ),
                      child: const Text('품절', style: TextStyle(color: Colors.white),),
                    ),), ),)
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Text(content[index].name.toString()),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: kGreyColor, fontSize: 12),
                children: [
                  TextSpan(
                      text: getPrice(content[index].price!.toInt()),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
                  const TextSpan(text:  "원", style: TextStyle(color: Colors.black)),
                  const TextSpan(text: ' / 구매가'),
                ],
              ),
            ),
            content[index].rental!.rentPrice != null ? RichText(
              text: TextSpan(
                style: const TextStyle(color: kGreyColor, fontSize: 12),
                children: [
                  TextSpan(
                    text: getPrice(content[index].rental!.rentPrice!.toInt()),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const TextSpan(text:  "원", style: TextStyle(color: Colors.black)),
                  const TextSpan(text: ' / 렌탈가(월)'),
                ],
              ),
            ) : Container(),
          ],
        )
    );
  }
}