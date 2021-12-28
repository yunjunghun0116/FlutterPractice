import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class GoogleMapDataController extends GetxController {
  static GoogleMapDataController get to => Get.find();
  String baseUrl = 'https://maps.googleapis.com/maps/api/geocode/json';

  Future<String> getLocationWithLatLng(
      double lat, double lng) async {
    String geocodeUrl =
        '$baseUrl?key=$kGoogleMapApiKey&latlng=$lat,$lng&language=ko';
    http.Response response = await http.get(Uri.parse(geocodeUrl));
    final Map<String, dynamic> responseData = jsonDecode(response.body);

    String formattedAddress = responseData['results'][0]['formatted_address'];

    return formattedAddress;
  }
}

