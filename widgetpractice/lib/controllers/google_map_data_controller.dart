import 'dart:convert';
import 'dart:ui';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class GoogleMapDataController extends GetxController {
  static GoogleMapDataController get to => Get.find();
  String geocodeBaseUrl = 'https://maps.googleapis.com/maps/api/geocode/json';
  String autoBaseUrl =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';

  Future<String> getLocationWithLatLng(double lat, double lng) async {
    String geocodeUrl =
        '$geocodeBaseUrl?key=$kGoogleMapApiKey&latlng=$lat,$lng&language=ko';
    http.Response response = await http.get(Uri.parse(geocodeUrl));
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    String formattedAddress = responseData['results'][0]['formatted_address'];

    return formattedAddress;
  }

  Future<void> searchLocationWithQuery(String query) async {
    String autoUrl =
        '$autoBaseUrl?input=$query&key=$kGoogleMapApiKey&language=ko';
    http.Response response = await http.get(Uri.parse(autoUrl));
    print(response.body);
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    List places = responseData['predictions'];
    for (var element in places) {
      print(element['description']);
    }
  }

  Future<void> searchLocationWithOpenApi(String query,int page) async {
    String _baseUrl = 'https://api.vworld.kr/req/';
    String _apiKey = '7EE0FED7-658D-39CA-BF3A-404EBF4C7D3C';
    String _placeUrl = '${_baseUrl}search?service=search&request=search&version=2.0&crs=EPSG:900913&size=15&page=$page&query=$query&type=PLACE&format=json&errorformat=json&key=$_apiKey';
    http.Response response = await http.get(Uri.parse(_placeUrl));
    Map<String,dynamic> res = jsonDecode(response.body);
    print(res['response']['result']['items']);
  }
}
