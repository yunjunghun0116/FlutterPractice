import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../constants/constants_color.dart';
import '../../controllers/filter_controller.dart';
import '../../screens/shopping/components/custom_decoration.dart';

class FilterSelectChip extends StatefulWidget {
  final String firstTitle;
  final List<String> firstListItem;
  final List<String> firstControllerItem;
  final String? secondTitle;
  final List<String>? secondListItem;
  final List<String>? secondControllerItem;
  final String? thirdTitle;
  final List<String>? thirdListItem;
  final List<String>? thirdControllerItem;
  final Function(List<String>)? onFirstSelectionChanged;
  final Function(List<String>)? onSecondSelectionChanged;
  final Function(List<String>)? onThirdSelectionChanged;
  final Function()? initializationEvent;
  final Function() confirmEvent;
  final bool? firstListMultiSelect;
  final bool? secondListMultiSelect;
  final bool? thirdListMultiSelect;

  const FilterSelectChip({Key? key, required this.firstTitle, required this.firstListItem, required this.firstControllerItem,
    this.onFirstSelectionChanged, this.initializationEvent, required this.confirmEvent,
    this.secondTitle, this.secondListItem, this.secondControllerItem, this.thirdTitle, this.thirdListItem, this.thirdControllerItem,
    this.firstListMultiSelect, this.secondListMultiSelect, this.thirdListMultiSelect, this.onSecondSelectionChanged, this.onThirdSelectionChanged}) : super(key: key);

  @override
  _FilterSelectChipState createState() => _FilterSelectChipState();
}

class _FilterSelectChipState extends State<FilterSelectChip> {
  final filterController = Get.put(FilterController());
  List<String> firstSelectedChoice = [];
  List<String> secondSelectedChoice = [];
  List<String> thirdSelectedChoice = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addListItem();
  }

  addListItem() {
    for(var item in filterController.getFirstSelectedItem){
      firstSelectedChoice.add(item);
    }
    for(var item in filterController.getSecondSelectedItem){
      secondSelectedChoice.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SizedBox(
        height: 350,
        child: Stack(
          children: [
            Padding(padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Padding(padding: const EdgeInsets.only(top: 10, bottom: 5), child: Text(widget.firstTitle, style: const TextStyle(color: kbF8a8b8dColor),),),
                    Wrap(
                      children: multiChoiceList(widget.firstListItem, firstSelectedChoice, widget.firstListMultiSelect, 'first'),
                    ),
                  ],
                ),
                Visibility(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Padding(padding: const EdgeInsets.only(top: 10, bottom: 5), child: Text(widget.secondTitle ?? '', style: const TextStyle(color: kbF8a8b8dColor),),),
                    Wrap(
                      children: multiChoiceList(widget.secondListItem ?? [], secondSelectedChoice, widget.secondListMultiSelect, 'second'),
                    )
                  ],
                ), visible: widget.secondListItem?.isNotEmpty ?? false),
                Visibility(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Padding(padding: const EdgeInsets.only(top: 10, bottom: 5), child: Text(widget.thirdTitle ?? '', style: const TextStyle(color: kbF8a8b8dColor),),),
                    Wrap(
                      children: multiChoiceList(widget.thirdListItem ?? [], thirdSelectedChoice, widget.thirdListMultiSelect, 'third'),
                    )
                  ],
                ), visible: widget.thirdListItem?.isNotEmpty ?? false),
                const SizedBox(height: 50,),
                const Spacer(),
              ],
            ),),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(child: InkWell(
                    onTap: (){
                      setState((){
                        firstSelectedChoice.clear();
                        secondSelectedChoice.clear();
                        widget.initializationEvent?.call();
                      });
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: customDecoration.borderBtnDecoration(Colors.black38),
                      child: const Text('초기화'),
                    ),
                  )),
                  Expanded(child: InkWell(
                    onTap: () {
                      filterController.saveFirstSelectedItem(firstSelectedChoice);
                      filterController.saveSecondSelectedItem(secondSelectedChoice);
                      widget.confirmEvent.call();
                      Get.back();
                    },
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      decoration: customDecoration.gradientGoldDecoration(),
                      child: const Text('확인', style: TextStyle(color: Colors.white),),
                    ),
                  )),
                ],
              ),
            )
          ],
        )
    ));
  }


  multiChoiceList(List<String> listItem, List<String> choiceItem, bool? multiSelected, String listNum){
    List<Widget> list = [];
    for (var item in listItem) {
      list.add(Container(
          padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
          child: ChoiceChip(
            label: Text(item),
            labelStyle: TextStyle(color: choiceItem.contains(item)/*widget.controllerItem.contains(item)*/ ? Colors.white : Colors.black),
            selectedColor: kMainColor,
            backgroundColor: Colors.white,
            selected: choiceItem.contains(item),//widget.controllerItem.contains(item),
            onSelected: (selected){
              //수정
              if(multiSelected == true && choiceItem.length == (listItem.length) && !choiceItem.contains(item)){
                choiceItem.removeLast();
                choiceItem.add(item);
              }else if(multiSelected == false && choiceItem.length == 1 && !choiceItem.contains(item)){
                choiceItem.clear();
                choiceItem.add(item);
              }else{
                choiceItem.contains(item) ? choiceItem.remove(item) : choiceItem.add(item);
              }
              // onSelectedListener.call();
              // widget.onSelectionChanged!.call(listItem);
              if(listNum == 'first'){
                widget.onFirstSelectionChanged!.call(choiceItem);
              }else if(listNum == 'second'){
                widget.onSecondSelectionChanged?.call(choiceItem);
              }else if(listNum == 'second'){
                widget.onThirdSelectionChanged?.call(choiceItem);
              }
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
                side: BorderSide(color: choiceItem.contains(item)/*widget.controllerItem.contains(item)*/ ? Colors.transparent : Colors.grey)),
          )
      ));
    }
    return list;
  }
}

