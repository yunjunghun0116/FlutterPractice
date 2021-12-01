import 'dart:convert';

class PickedLocation {
  String id;
  String comment;
  String address;
  double lat;
  double lng;

  PickedLocation({
    required this.id,
    required this.comment,
    required this.address,
    required this.lat,
    required this.lng,
  });
  
  @override
  String toString() {
    // TODO: implement toString
    Map<String,dynamic> body = {
      'id': id,
      'comment': comment,
      'address':address,
      'lat':lat,
      'lng':lng
    };
    return jsonEncode(body);
  }
}
