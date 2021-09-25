import 'package:get/get.dart';
import 'package:mypetmoments/controller/api_connect.dart';

class PlaceController extends GetxController {
  static PlaceController get to => Get.find();
  RxList<dynamic> _placeList = [].obs;
  RxInt _currentPage = 1.obs;

  Future<void> getList(String placeName)async{
    ApiConnect _connection = ApiConnect();
    var newLists = await _connection.getPlaceList(placeName, _currentPage.value);
    var newPlaces = newLists.body['response']['result']['items'];
    _placeList.add(newPlaces);
    print(newPlaces);
  }

  void nextPage(){
    _currentPage++;
  }
  void prevPage(){
    if(_currentPage > 1){
      _currentPage --;
    }else{
      _currentPage = 1.obs;
    }
  }


  RxList<dynamic> get placeList => _placeList;

}
