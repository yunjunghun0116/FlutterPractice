import 'package:get/get.dart';

class ApiConnect extends GetConnect {
  String _baseUrl = 'https://api.vworld.kr/req/';
  String _apiKey = '7EE0FED7-658D-39CA-BF3A-404EBF4C7D3C';

  Future<Response> getPlaceList(String placeName,int page)async{
    String getUrl = '${_baseUrl}search?service=search&request=search&version=2.0&crs=EPSG:900913&size=15&page=${page}&query=${placeName}&type=place&format=json&errorformat=json&key=${_apiKey}';
    var _returnedData = await get(getUrl);
    return _returnedData;
  }

}
