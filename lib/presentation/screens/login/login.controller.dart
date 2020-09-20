import 'package:arctekko/services/users/auth.service.dart';
import 'package:get/get.dart';

import '../../shared/loading/loading.controller.dart';

class LoginController extends GetxController {
  var _username = ''.obs;
  var _errorMessage = ''.obs;

  String get username => _username.value;
  set username(String value) => _username.value = value;
  void onUsernameInputChange(String value) {
    _username.value = value;
    _errorMessage.value = '';
  }

  String get errorMessage => _errorMessage.value;

  void onLogin() async {
    final loadingController = Get.find<LoadingController>();
    loadingController.isLoading = true;

    try {
      final user = await AuthService.login(username);

      if (user == null) {
        _errorMessage.value = 'User not found';
      } else {
        Get.offNamed('home');
      }
    } catch (err) {
      print(err);
      _errorMessage.value = 'Unexpected error, please try again later';
    }

    loadingController.isLoading = false;
  }
}
