import 'package:get/get.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  final Location location = Location();
  late PermissionStatus _permissionStatus;
  late LocationData _locationData;

  @override
  void onInit() async {
    print('LocationController onInit');
    super.onInit();
  }

  Future<LocationData> getLocation() async {
    _permissionStatus = await location.hasPermission();
    if (_permissionStatus == PermissionStatus.denied) {
      _permissionStatus = await location.requestPermission();
      if (_permissionStatus != PermissionStatus.granted) {}
    }

    _locationData = await location.getLocation();
    return _locationData;
  }
}
