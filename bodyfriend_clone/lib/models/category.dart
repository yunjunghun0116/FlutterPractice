class Category {
  final int id;
  final String name;
  final String icon; //iconUrl
  final String type;
  final int displayNo;
  final bool deleted;
  final String createdBy;
  final DateTime createdAt;
  final String? modifiedBy;
  final DateTime? modifiedAt;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.type,
    required this.displayNo,
    required this.deleted,
    required this.createdBy,
    required this.createdAt,
    this.modifiedBy,
    this.modifiedAt,
  });

  factory Category.fromJson(json) => Category(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        type: json['type'],
        displayNo: json['displayNo'],
        deleted: json['deleted'],
        createdBy: json['createdBy'],
        createdAt: DateTime.parse(json['createdAt']),
        modifiedBy: json['modifiedBy'],
        modifiedAt: json['modifiedAt'] != null
            ? DateTime.parse(json['modifiedAt'])
            : null,
      );
}
