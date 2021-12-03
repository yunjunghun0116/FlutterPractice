import 'package:get/get.dart';
import 'package:kakaologinandgooglemaps/models/picked_location.dart';
import 'package:uuid/uuid.dart';

class PickLocationController extends GetxController{
  static PickLocationController get to => Get.find();
  List<PickedLocation> _pickedLocation = [];
  Uuid uuid = const Uuid();

  List<PickedLocation> get pickedLocations => _pickedLocation;

  Future<void> getLocations() async{
    await Future.delayed(const Duration(seconds: 1));
    update();
  }
  Future<void> addLocation(PickedLocation newLocation)async{
    await Future.delayed(const Duration(seconds: 1));
    newLocation.id = uuid.v4();
    _pickedLocation.add(newLocation);
    update();
  }
  Future<void> deleteLocation(String locationId)async{
    await Future.delayed(const Duration(seconds: 1));
    _pickedLocation=_pickedLocation.where((element) => element.id != locationId).toList();
    update();
  }


}