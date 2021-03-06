class Chair {
  final int id;
  final String name;
  final String shortDesc;
  final String listImage;
  final int price;
  final int rentPrice;
  final int popularScore;
  final List detailImage;
  final int salesCount;
  final String goodsInfo;

  Chair({
    required this.id,
    required this.name,
    required this.shortDesc,
    required this.listImage,
    required this.price,
    required this.rentPrice,
    required this.popularScore,
    required this.detailImage,
    required this.salesCount,
    required this.goodsInfo,
  });

  factory Chair.fromJson(json) {
    return Chair(
      id: json['id'],
      name: json['name'],
      shortDesc: json['shortDesc'],
      listImage: json['listImage'],
      price: json['price'],
      rentPrice: json['rentPrice'],
      popularScore: json['popularScore'],
      detailImage: json['detailImage'],
      salesCount: json['salesCount'] ?? 0,
      goodsInfo: json['goodsInfo'],
    );
  }
}
