import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/constants_color.dart';
import '../../controllers/filter_controller.dart';
import '../../models/shopping/shopping_category_list_model.dart';

class ShoppingSelectChip extends StatefulWidget {
  final List<CategoryData> listItem;
  final List<CategoryData> controllerItem;
  final Function(List<CategoryData>)? onSelectionChanged;
  final Function(List<CategoryData>)? onMaxSelected;
  final int? maxSelection;

  ShoppingSelectChip(this.listItem, this.controllerItem, {this.onSelectionChanged, this.onMaxSelected, this.maxSelection});

  @override
  _ShoppingSelectChipState createState() => _ShoppingSelectChipState();
}

class _ShoppingSelectChipState extends State<ShoppingSelectChip> {
  // List<String> selectedChoices = [];
  final filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: whiteChoiceList()
    );
  }

  //쇼핑 단일 선택 UI(흰배경 검은글씨)
  whiteChoiceList(){
    List<Widget> list = [];
    print('eeeeef');
    for (var item in widget.listItem) {
      list.add(Container(
          padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
          child: ChoiceChip (
            label: Text(item.name.toString()),
            labelStyle: TextStyle(color: widget.controllerItem.contains(item)/*selectedChoices.contains(item)*/ ? Colors.white : Colors.black),
            selectedColor: kMainColor,
            backgroundColor: Colors.white,
            selected: widget.controllerItem.contains(item),//selectedChoices.contains(item),
            onSelected: (selected){
              // if(selectedChoices.length == (widget.maxSelection ?? -1) && !selectedChoices.contains(item)){
              // widget.onMaxSelected?.call(selectedChoices);
              // if(selectedChoices.length == (widget.maxSelection ?? -1) && !selectedChoices.contains(item)){
              //수정
              print('test');
              print(item.name);
              // print(widget.controllerItem[0].name);
              //선택 된 아이템이 maxSelection 값보다 클 경우 마지막거 지우고 아이템 추가
              print('eeeee $selected');
              if(widget.controllerItem.length == (widget.maxSelection ?? -1) && !widget.controllerItem.contains(item)){
                widget.controllerItem.removeLast();
                widget.controllerItem.add(item);
                widget.onSelectionChanged?.call(widget.controllerItem);
              }else{ //이미 선택된 아이템 중복 클릭 시 취소 아니면 추가
                // selectedChoices.contains(item) ? selectedChoices.remove(item) : selectedChoices.add(item);
                widget.controllerItem.contains(item) ? widget.controllerItem.remove(item) : widget.controllerItem.add(item);
                widget.onSelectionChanged?.call(widget.controllerItem);
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: BorderSide(color: widget.controllerItem.contains(item) ? Colors.transparent : Colors.grey)),
          )
      ));
    }
    return list;
  }

// greyChoiceList(){
//   List<Widget> list = [];
//   for (var item in widget.listItem) {
//     list.add(Container(
//         padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
//         child: ChoiceChip(
//           label: Text(item),
//           labelStyle: TextStyle(color: widget.controllerItem.contains(item) ? Colors.white : Colors.black),
//           selectedColor: kMainColor,
//           backgroundColor: Colors.white,
//           selected: widget.controllerItem.contains(item),
//           onSelected: (selected){
//             //수정
//             if(widget.controllerItem.length == (widget.maxSelection ?? -1) && !widget.controllerItem.contains(item)){
//               widget.controllerItem.removeLast();
//               widget.controllerItem.add(item);
//               widget.onSelectionChanged?.call(widget.controllerItem);
//             }else{
//               widget.controllerItem.contains(item) ? widget.controllerItem.remove(item) : widget.controllerItem.add(item);
//               widget.onSelectionChanged?.call(widget.controllerItem);
//             }
//           },
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(3),
//               side: BorderSide(color: widget.controllerItem.contains(item) ? Colors.transparent : Colors.grey)),
//         )
//     ));
//   }
//   return list;
// }

}

