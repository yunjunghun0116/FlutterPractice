import 'package:app/screens/shopping/shopping_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../controllers/shopping_controller.dart';

class ShoppingCustomRadio extends StatelessWidget {
  ShoppingCategoryModel? _model;
  ShoppingCustomRadio(this._model);

  @override
  Widget build(BuildContext context) {
    // final controller = ShoppingController();
    //
    // Get.lazyPut<Shopp ingController>(() => ShoppingController(), fenix: true);

    return Padding(padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("images/png/icon/Group 1866@2x.png", color: _model!.isSelected ? Colors.black : Colors.grey, width: 30, ),
          const SizedBox(height: 5,),
          Text(_model!.title.toString(),)
        ],
      ),);
  }
}
