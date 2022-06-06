class Benefit{
  final String text;
  final String highlight;
  final String color;

  Benefit({required this.text, required this.highlight, required this.color,});

  factory Benefit.fromJson(json) => Benefit(
    text: json['text'],
    highlight: json['highlight'],
    color: json['color'],
  );
}