class Chair {
  final String id;
  final String imageUrl;
  final String title;
  final int price;
  final int rentalPrice;
  final double point;
  final List pointUser;

  Chair({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rentalPrice,
    required this.point,
    required this.pointUser,
  });

  factory Chair.fromJson(json) => Chair(
        id: json['id'],
        imageUrl: json['imageUrl'],
        title: json['title'],
        price: json['price'],
        rentalPrice: json['rentalPrice'],
        point: json['point'],
        pointUser: json['pointUser'],
      );
}
