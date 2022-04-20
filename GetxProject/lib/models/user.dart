class User {
  final String name;
  final String message;
  int age;

  User({
    required this.name,
    required this.message,
    required this.age,
  });

  void addAge(){
    age++;
  }

}
