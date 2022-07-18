class ProductRating {
  final double startPoint;
  final int reviewCount;

  ProductRating({
    required this.startPoint,
    required this.reviewCount,
  });

  factory ProductRating.fromJson(json) => ProductRating(
        startPoint: json['startPoint'],
        reviewCount: json['reviewCount'],
      );
}
