import 'package:arctekko/presentation/screens/login/login.controller.dart';
import 'package:get/get.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
