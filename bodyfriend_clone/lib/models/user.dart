class User {
  final String id;

  User({required this.id});

  factory User.fromJson(json) => User(
        id: json['id'],
      );
}
