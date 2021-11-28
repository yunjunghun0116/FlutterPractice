import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController{
  double _latitude = 37;
  double _longitude = 127;
  static LocationController get to => Get.find();

  Future<void> getLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    _latitude = position.latitude;
    _longitude = position.longitude;
    update();
  }
  void changeLocation(double ilatitude,double ilongitude) async{
    _latitude = ilatitude;
    _longitude = ilongitude;
    update();
  }

  double get latitude => _latitude;
  double get longitude => _longitude;

}