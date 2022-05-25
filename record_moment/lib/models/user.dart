class User {
  final String id;
  final String name;
  final String email;
  final String birthDate;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.birthDate,
  });

  factory User.fromJson(json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      birthDate: json['birthDate'],
    );
  }
}
