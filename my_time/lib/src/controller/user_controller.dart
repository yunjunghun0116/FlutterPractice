import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();
  User user = FirebaseAuth.instance.currentUser!;

  String get displayName => user.displayName??'';
  String get phoneNumber => user.phoneNumber??'';
  String get photoURL => user.photoURL??'';
  String get uid => user.uid;
  
  Future<void> changeDisplayName(String newName)async {
    await user.updateDisplayName(newName);
  }
  Future<void> changePhotoURL(String newPhoto)async{
    await user.updatePhotoURL(newPhoto);
  }


}
