


import 'package:app/components/view/filter_select_chip.dart';
import 'package:app/components/view/navigation_bar_view.dart';
import 'package:app/components/view/top_scroll_button.dart';
import 'package:app/controllers/filter_controller.dart';
import 'package:app/enum/enum.dart';
import 'package:app/icon.dart';
import 'package:app/screens/shopping/pages/product_search_page.dart';
import 'package:app/controllers/shopping_controller.dart';
import 'package:app/screens/shopping/pages/shopping_detail_screen.dart';
import 'package:app/screens/shopping/pages/shopping_cart_screen.dart';
import 'package:app/screens/shopping/shopping_category_model.dart';
import 'package:app/screens/shopping/shopping_select_chip.dart';
import 'package:app/utils/network_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants_color.dart';
import '../../models/shopping/shopping_banner_model.dart';
import '../../models/shopping/shopping_category_list_model.dart';
import '../../models/shopping/shopping_list_model.dart';
import '../../utils/format_utils.dart';
import 'components/custom_decoration.dart';
import 'components/product_list_item.dart';


//https://membership.bodyfriend.me/api/v1/goods/category

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({Key? key}) : super(key: key);

  @override
  _ShoppingScreenState createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> with SingleTickerProviderStateMixin{
  bool? _loading = false;
  ShoppingListData shoppingListModel = ShoppingListData();
  List<ShoppingCategoryModel> listModel = [];
  List<CategoryData> categoryData = [];
  List<CategoryData> filterCategorykind = [];
  List<CategoryData> filterCategotyLine = [];
  List<BannerData> bannerData = [];
  final shoppingController = Get.put(ShoppingController());
  final filterController = Get.put(FilterController());
  String categoryCode = "10";
  String filterCategoryCode = "";
  ScrollController scrollController = ScrollController();
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose(){
    super.dispose();
    print('shopping Dispose');
    scrollController.dispose();
  }

  loadData() async{
    await fetch(categoryCode, false);
  }

  // sort = LATEST, HIGH_PRICE, LOW_PRICE, RECOMMEND, POPULAR
  Future<ShoppingListData?> fetch(String categoryCode, bool changeFilter, {filterKind, filterLine}) async{
    shoppingListModel = await NetworkUtils().getShoppingList({
      'categoryCode' : categoryCode,
      'sort' : 'POPULAR',
      'goodsType' : 'NORMAL',
      'page' : 0,
      'size' : 40
    });
    shoppingListModel.empty == false ? _loading = true : _loading = false;
    shoppingController.setTotalElement(shoppingListModel.totalElements ?? 0);
    if(!changeFilter){
      String index= categoryIndex(selectIndex);
      await filterKindFetch(index);
    }
    setState(() {

    });
    return shoppingListModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavigationBarView(
          title: '??????',
          type: NavigationType.main,
          buttonTypes: const [
            NavigationButtonType.search,
            NavigationButtonType.cart
          ]
      ),
      body: SafeArea(
        child: Obx(() => RefreshIndicator(
            color: Colors.black,
            child: Stack(
              children: [
                showBody(),
                TopScrollButton(controller: scrollController, bottomHeight: 3),
              ],
            ), onRefresh: onRefresh)),
      ),
    );
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 500));
    //refresh contents
    await fetch(shoppingController.getShoppingIndicator, false);
  }


  Future<List<BannerData>> bannerFetch() async {
    await Future.delayed(const Duration(milliseconds: 50));
    bannerData = await NetworkUtils().getShoppingBanner();
    return bannerData;
  }

  Future<List<CategoryData>> categoryFetch(String filterCategoryCode) async {
    await Future.delayed(const Duration(milliseconds: 50));
    categoryData = await NetworkUtils().getShoppingCategoryList({
      'code' : filterCategoryCode
    });
    return categoryData;
  }

  Future<List<CategoryData>> filterKindFetch(String filterCategoryCode) async {
    await Future.delayed(const Duration(milliseconds: 50));
    filterCategorykind = await NetworkUtils().getShoppingCategoryList({
      'code' : filterCategoryCode
    });
    return filterCategorykind;
  }

  Future<List<CategoryData>> filterLineFetch(String filterCategoryCode) async {
    await Future.delayed(const Duration(milliseconds: 50));
    filterCategotyLine = await NetworkUtils().getShoppingCategoryList({
      'code' : filterCategoryCode
    });
    return filterCategotyLine;
  }


  showBody(){
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              showBanner(),
              const SizedBox(height: 10,),
              showCategoryList(),
              Column(
                children: const [
                  Divider(),
                  SizedBox(height: 10,),
                ],
              ),
              showFilter(),
            ],
          ),
        ),
        // showList()
        _loading == true ? showList() : const SliverToBoxAdapter(child: CircularProgressIndicator(),)
      ],
    );
  }

  Widget showBanner(){
    return FutureBuilder(
        future: bannerFetch(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData == false){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasError) {
            return const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("ERROR"),
            );
          }else{
            return CarouselSlider.builder(
                itemCount: bannerData.length,
                itemBuilder: (BuildContext context, int index, id){
                  return SizedBox(
                    width: double.infinity,
                    child: Image.network(bannerData[index].bannerImage.toString(), fit: BoxFit.cover,),
                  );
                }, options: CarouselOptions(
                viewportFraction: 1,
                enableInfiniteScroll: false
            ));
          }
        });
  }

  showCategoryList(){
    return FutureBuilder(
        future: categoryFetch(filterCategoryCode),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(snapshot.hasData == false){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasError) {
            return const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("ERROR"),
            );
          }else{
            return SizedBox(
              height: 70,
              child: Center(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categoryData.length,
                    itemBuilder: (BuildContext context, int index){
                      // filterCategoryFetch(categoryCode: categoryData[index].code);
                      String? img = categoryData[index].imageUrl;
                      String? title = categoryData[index].name;
                      return InkWell(
                        onTap: (){
                          selectIndex = index;
                          String value = categoryIndex(selectIndex);
                          fetch(value, false);
                          shoppingController.setListIndicator(value);
                        },
                        child: Padding(padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              img == null ? Container() : Image.network(img, width: 30, color: selectIndex == index ? Colors.black : Colors.grey,),
                              Text(title!, style: TextStyle(color: selectIndex == index ? Colors.black : Colors.grey),)
                            ],
                          ),),
                      );
                    }),
              ),
            );
          }
        });
  }

  showFilter(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: () async{
            await showFilterBottomSheet();
          },
          child: Row(
            children: [
              Image.asset("images/ic_filter.png"),
              const SizedBox(width: 5,),
              const Text('?????? ??', style: TextStyle(fontSize: 14, color: kGreyColor),),
            ],
          ),),
        RichText(text: TextSpan(
            children: [
              TextSpan(
                text: shoppingController.totalElements.toString(), style: const TextStyle(color: kMainColor),
              ),
              const TextSpan(
                  text: "???", style: TextStyle(color: Colors.black)
              )
            ]
        ),),
        const Spacer(),
        MaterialButton(
          minWidth: 20,
          onPressed: (){filterSheet();},
          child: Row(
            children: const [
              Text('?????????'),
              Icon(Icons.arrow_drop_down)
            ],
          ),)
      ],
    );
  }


  String categoryIndex(int selectedIndex){
    String index = '';
    switch(selectedIndex){
      case 0:
        index = "10";
        break;
      case 1:
        index = "20";
        break;
      case 2:
        index = "30";
        break;
      case 3:
        index = "40";
        break;
      case 4:
        index = "50";
        break;
    }
    return index;
  }

  showList(){
    List<Content>? content = shoppingListModel.content;
    return SliverPadding(padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 10.0, //item ?????? ??????
          crossAxisSpacing: 5.0, //item?????? ?????? ??????
          childAspectRatio: 1/1.6, //???, ??? ??????
          maxCrossAxisExtent: 200.0, //??? ?????? max???
        ), delegate: SliverChildBuilderDelegate((BuildContext context, int index){
        return ProductListItem().showListItem(content, index);
      },childCount: content!.length),
      ),);
  }

  List<String> orderList = ['????????????', '?????? ?????????', '?????? ?????????', '?????????', '?????????'];
  void showOrderBottomSheet(){
    Get.bottomSheet(SizedBox(
      height: 200,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return MaterialButton(onPressed: (){

          },
            child: Text(orderList[index]),);
        }, itemCount: orderList.length, separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    ),
        backgroundColor: Colors.white,
        elevation: 0);
  }

  void filterSheet(){
    Get.bottomSheet(
      StatefulBuilder(builder: (context, setState){
        return SafeArea(
            child: FilterSelectChip(
                firstTitle: '?????? ??????',
                firstListItem: kindlist,
                firstControllerItem: filterController.getFirstSelectedItem,
                secondTitle: '?????? ??????',
                secondListItem: lineList,
                secondControllerItem: filterController.getSecondSelectedItem,
                thirdTitle: '??????',
                // thirdListItem: kindlist,
                firstListMultiSelect: false,
                secondListMultiSelect: true,
                // thirdListMultiSelect: false,
                initializationEvent: (){
                  print('?????????');
                },
                confirmEvent: (){
                  print('??????');
                },
                onFirstSelectionChanged: (selectedItem) async{
                  if(selectedItem.contains('????????????')){
                    lineList = ['Luxury', 'Prestige', 'Premium', 'Economy', '?????????', '????????????', '????????????'];
                  }else{
                    lineList.clear();
                  }
                  setState((){

                  });
                },
                onSecondSelectionChanged: (selectItem) async{
                  setState((){

                  });
                },
            ),);
      }), backgroundColor: Colors.white,
    );
  }

  List<String> kindlist = ['????????????', '???????????????', '?????????'];
  List<String> lineList = [];

  String lineIndex = "1010";

  showFilterBottomSheet() async{

    Get.bottomSheet(
        StatefulBuilder(builder: (context, setState){
          return SafeArea(child: SizedBox(
              height: 300,
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          const Text('?????? ??????', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                          showFilterKindList(setState),
                          const SizedBox(height: 10,),
                          showFilterLineList(setState),
                        ],
                      ),),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        Expanded(child: InkWell(
                          onTap: (){
                            filterController.saveSPLineSelectedItem([]);
                            filterController.saveSPKindSelectedItem([]);
                            setState((){
                            });
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            decoration: customDecoration
                                .borderBtnDecoration(Colors.black38),
                            child: const Text('?????????'),
                          ),
                        )),
                        Expanded(child: InkWell(
                          onTap: (){
                            Get.back(result: 'String');
                            fetch(filterController.getlineSelectedItem.isNotEmpty ? filterController.getlineSelectedItem[0].code.toString() : '0', true);
                          },
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            decoration: customDecoration.gradientGoldDecoration(),
                            child: const Text('??????', style: TextStyle(color: Colors.white),),
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              )
          ));
        }), backgroundColor: Colors.white,
    );
  }

  Widget showFilterKindList(setState) {
    return ShoppingSelectChip(filterCategorykind, filterController.getKindSelectedItem,
      onSelectionChanged: (value) async{
        await filterLineFetch(lineIndex);
        setState(() {
            filterController.saveSPKindSelectedItem(value);
          });
      },
      maxSelection: 1,);
  }

  Widget showFilterLineList(setState){
    lineList = [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        filterController.getKindSelectedItem.isNotEmpty && filterController.getKindSelectedItem[0].name == '????????????' ? const Text('?????? ??????', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)) : const SizedBox(),
        filterController.getKindSelectedItem.isNotEmpty && filterController.getKindSelectedItem[0].name == '????????????'
            ? ShoppingSelectChip(filterCategotyLine,
          filterController.getlineSelectedItem,
          onSelectionChanged: (value) async{
            print('bbbbb ${filterController.getlineSelectedItem}');
            print(value);
            setState(() {
              filterController.saveSPLineSelectedItem(value);
            });
          },
          maxSelection: 1,) : const SizedBox()
      ],
    );
  }

}



