import 'package:arctekko/services/users/auth.service.dart';

class Routes {
  static Future<String> get initialRoute async {
    return AuthService.isAuthenticated ? HOME : LOGIN;
  }

  static const LOGIN = 'login';
  static const HOME = 'home';
}
