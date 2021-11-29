class PlaceDetail {
  final String placeId;
  final String formattedAddress;
  final String formattedPhoneNumber;
  final String name;
  final double rating;
  final String vicinity;
  final String website;
  final double lat;
  final double lng;

  PlaceDetail({
    required this.placeId,
    required this.formattedAddress,
    required this.formattedPhoneNumber,
    required this.name,
    required this.rating,
    required this.vicinity,
    required this.website,
    required this.lat,
    required this.lng,
  });

  factory PlaceDetail.fromJson(Map<String, dynamic> json) => PlaceDetail(
    placeId: json['place_id'],
    formattedAddress: json['formatted_address']??'',
    formattedPhoneNumber: json['formatted_phone_number']??'',
    name: json['name'],
    rating: json['rating']??0,
    vicinity: json['vicinity'],
    website: json['website']??'',
    lat: json['geometry']['location']['lat'],
    lng: json['geometry']['location']['lng'],
  );

  Map<String,dynamic> toMap(){
    return{
      'placeId': placeId,
      'formattedAddress': formattedAddress,
      'formattedPhoneNumber': formattedPhoneNumber,
      'name': name,
      'rating': rating,
      'vicinity': vicinity,
      'website': website,
      'lat': lat,
      'lng': lng
    };
  }
}
