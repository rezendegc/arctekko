import 'package:arctekko/services/posts/post.model.dart';
import 'package:arctekko/services/users/auth.service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PostsService {
  /// Get all posts from current logged user
  static Future<List<Post>> getPostsFromLoggedUser() async {
    final user = AuthService.getUser();
    if (user == null) return null;

    final dio = Get.find<Dio>();
    final response = await dio.get('users/${user.id}/posts');

    if (response.statusCode != 200) throw Error();

    final data = response.data as List;
    final postsList = data?.map((e) => Post.fromJson(e))?.toList();

    return postsList ?? [];
  }
}
