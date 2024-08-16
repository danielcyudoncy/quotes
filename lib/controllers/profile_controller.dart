import 'package:get/get.dart';

class ProfileController extends GetxController {
  var fullName = ''.obs;
  var email = ''.obs;
  var profileImage = ''.obs;

  void updateProfile() {}

  void pickImage(String imagePath) {
    profileImage.value = imagePath;
  }
}
