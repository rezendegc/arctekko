import 'package:arctekko/services/users/user.model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UsersService {
  /// Try to find User on api, if found set it on Get
  /// and return the found user, returns null otherwise.
  ///
  /// All routing should be done outside.
  static Future<User> login(String username) async {
    final dio = Get.find<Dio>();

    final response = await dio.get('users');

    if (response.statusCode != 200) return null;
    final data = response.data as List;
    final userList = data.map((e) => User.fromJson(e)).toList();
    final user = userList.firstWhere(
      (user) => user.username == username,
      orElse: () => null,
    );

    if (user != null) Get.put(user, tag: 'auth');

    return user;
  }
}
