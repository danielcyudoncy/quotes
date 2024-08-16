import 'package:get/get.dart';
import 'package:quotes/controllers/auth_controller.dart';
import 'package:quotes/controllers/profile_controller.dart';
import 'package:quotes/controllers/register_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
