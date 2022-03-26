import 'package:huntalk/models/chatRoom.dart';

class User {
  final String id;
  final String name;
  final String imageUrl;
  final String email;
  final String password;
  final String phone;
  final List chatRoomList;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.email,
    required this.password,
    required this.phone,
    required this.chatRoomList,
  });

  factory User.fromJson(json) => User(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        chatRoomList: json['chatRoomList'].map((chatRoom) {
          return {
            'id': chatRoom['id'],
            'userList': chatRoom['userList'],
          };
        }).toList(),
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'email': email,
      'password': password,
      'phone': phone,
      'chatRoomList': chatRoomList,
    };
  }
}
