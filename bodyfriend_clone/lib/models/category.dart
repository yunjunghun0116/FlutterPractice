class Category {
  final String code;
  final String name;
  final String fullCategoryName;
  final String image;
  final bool active;

  Category({
    required this.code,
    required this.name,
    required this.fullCategoryName,
    required this.image,
    required this.active,
  });

  factory Category.fromJson(json) => Category(
    code: json['code'],
    name: json['name'],
    fullCategoryName: json['fullCategoryName'],
    image: json['image']??'',
    active: json['active']
  );
}
