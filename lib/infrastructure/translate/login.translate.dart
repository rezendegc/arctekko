import 'package:get/get.dart';

class LoginTranslate {
  static const _INITIAL = 'home';
  static const _APP_BAR = '$_INITIAL-app-bar';
  static const _LOGIN = '$_INITIAL-login';
  static String get appBar => _APP_BAR.tr;
  static String get login => _LOGIN.tr;

  static Map<String, String> translatePTBR = {
    _APP_BAR: 'Bem vindo ao Login',
    _LOGIN: 'Entrar',
  };

  static Map<String, String> translateEN = {
    _APP_BAR: 'Welcome to Login',
    _LOGIN: 'Login',
  };
}
