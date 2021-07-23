import 'package:geolocator/geolocator.dart';

class Location{

  double latitude;
  double longitude;

  //return 이 void 즉 리턴값이 없는것임.
  Future<void> getCurrentLocation() async {
    try{
      Geolocator.checkPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    }catch(e){
      print(e);
    }

  }

}

