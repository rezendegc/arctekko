import 'package:arctekko/services/users/user.model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class AuthService {
  /// Returns if is user is logged
  static bool get isAuthenticated => Get.find<User>() != null;

  static User getUser() => Get.find<User>();

  /// Try to find User on api, if found set it on Get and SharedPrefs
  /// then return the found user, returns null otherwise.
  ///
  /// All routing should be done outside this function.
  static Future<User> login(String username) async {
    final dio = Get.find<Dio>();
    final response = await dio.get('users');

    if (response.statusCode != 200) throw Error();

    final data = response.data as List;

    final userList = data?.map((e) => User.fromJson(e))?.toList() ?? [];
    final user = userList.firstWhere(
      (user) => user.username == username,
      orElse: () => null,
    );

    if (user != null) {
      Get.put(user);
      await user.persist(key: 'auth');
    }

    return user;
  }

  /// Basically removes user instance from tree and SharedPrefs
  ///
  /// All routing should be done outside this function.
  static void logout() async {
    final user = Get.find<User>();

    await Get.delete<User>();
    await user.remove(key: 'auth');
  }

  static Future<void> initializeAuth() async {
    final user = await User().retrieveFromKey('auth');
    if (user != null) Get.put(user);
  }
}
