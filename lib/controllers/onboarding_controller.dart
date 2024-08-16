import 'package:get/get.dart';

class OnboardingController extends GetxController {
  void navigateToLogin() {
   
    Get.offAllNamed('/register');
  }
}
