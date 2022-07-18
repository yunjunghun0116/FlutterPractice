class PointItem {
  final int id;
  final String name;
  final String shortDesc;
  final String listImage;
  final int price;
  final int reducePrice;
  final int popularScore;
  final List detailImage;
  final String goodsInfo;

  PointItem(
      {required this.id,
      required this.name,
      required this.shortDesc,
      required this.listImage,
      required this.price,
      required this.reducePrice,
      required this.popularScore,
      required this.detailImage,
      required this.goodsInfo});

  factory PointItem.fromJson(json) {
    return PointItem(
      id: json['id'],
      name: json['name'],
      shortDesc: json['shortDesc'],
      listImage: json['listImage'],
      price: json['price'],
      reducePrice: json['reducePrice'] ?? 0,
      popularScore: json['popularScore'],
      detailImage: json['detailImage'],
      goodsInfo: json['goodsInfo'],
    );
  }
}
