import 'package:flutter/material.dart';
import 'package:record_moment/services/user_service.dart';

import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  User? user;

  Future<bool> registerUser({
    required String email,
    required String password,
  }) async {
    UserService().registerUser(
        email: email, password: password, name: "", birthDate: "");
    return false;
  }
}
