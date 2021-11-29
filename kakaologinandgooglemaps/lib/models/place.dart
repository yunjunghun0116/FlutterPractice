class Place {
  final String decription;
  final String placeId;
  Place({required this.decription, required this.placeId});

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeId: json['place_id'],
        decription: json['description'],
      );
  Map<String, dynamic> toMap() {
    return {
      'description': decription,
      'placeId': placeId,
    };
  }
}
