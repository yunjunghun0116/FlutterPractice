import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PetController extends GetxController {
  static PetController get to => Get.find();
  User? petData;

  @override
  void onInit() {
    petData = FirebaseAuth.instance.currentUser!;
    super.onInit();
  }

  String get petName => petData!.displayName!;
  String get petId => petData!.uid;

  void changePetName(String newName) async {
    await petData!.updateDisplayName(newName);
  }
}
