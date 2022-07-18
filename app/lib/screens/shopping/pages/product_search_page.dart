import 'package:app/controllers/shopping_controller.dart';
import 'package:app/screens/shopping/pages/shopping_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../constants/constants_color.dart';
import '../../../icon.dart';
import '../../../models/shopping/shopping_list_model.dart';
import '../../../utils/format_utils.dart';
import '../../../utils/network_utils.dart';
import '../components/product_list_item.dart';

class ProductSearchPage extends StatefulWidget {
  const ProductSearchPage({Key? key}) : super(key: key);

  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  ShoppingListData shoppingListModel = ShoppingListData();
  final TextEditingController _searchQuery = TextEditingController();
  final controller = Get.put(ShoppingController());
  bool loading = false;
  String? searchName;
  bool searchStart = false;
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: MaterialButton(onPressed: (){Get.back();},
            padding: const EdgeInsets.all(10.0),
            minWidth: 30,
            shape: const CircleBorder(),
            child: const Icon(Icons.arrow_back),),
          actions: [
            MaterialButton(onPressed: (){},
              padding: const EdgeInsets.all(10.0),
              minWidth: 30,
              shape: const CircleBorder(),
              child: Image.asset("images/ic_shopping_cart@2x.png", color: Colors.black, width: 20,),)
          ],
          title: TextField(
            textInputAction: TextInputAction.go,
            onSubmitted: (value){
              print(value);
              setState(() {
                searchStart = true;
                searchName = value;
              });
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "검색어 입력",
            ),
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text('인기순'),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                  ),
              ),
              SliverFillRemaining(
              child: searchStart ? FutureBuilder(
                  future: fetch(searchName!),
                  builder: (BuildContext context, AsyncSnapshot snapshot){
                    if(snapshot.hasData == false){
                      return const Center(
                          child: CircularProgressIndicator()
                      );
                    }else if(snapshot.hasError){
                      return Text('Errer : ${snapshot.error}');
                    }else{
                      shoppingListModel = snapshot.data;
                      if(shoppingListModel.content!.isEmpty){
                        return const Center(child: Text('검색 결과가 없습니다.'));
                      }else{
                        // return Text(shoppingListModel.content![0].price.toString());
                        return Padding(padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: GridView.builder(
                            itemCount: shoppingListModel.content!.length,
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 10.0, //item 높이 공백
                              crossAxisSpacing: 5.0, //item사이 넓이 공백
                              childAspectRatio: 1/1.6, //행, 열 비율
                              maxCrossAxisExtent: 200.0, //열 높이 max값
                            ),
                            itemBuilder: (BuildContext context, int index){
                              return ProductListItem().showListItem(shoppingListModel.content, index);
                            },
                          ),);
                      }
                    }
                  }) : const Center(child: Text('검색 결과가 없습니다.'),
              )
              )
            ],
          ),
        )
    );
  }

  // sort = LATEST, HIGH_PRICE, LOW_PRICE, RECOMMEND, POPULAR
  Future<ShoppingListData?> fetch(String name) async{
    shoppingListModel = await NetworkUtils().getShoppingList({
      'sort' : 'POPULAR',
      'goodsType' : 'NORMAL',
      'page' : 0,
      'name' : name
      // 'size' : 40
    });

    return shoppingListModel;
  }
}

