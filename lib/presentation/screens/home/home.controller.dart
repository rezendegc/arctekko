import 'package:arctekko/services/posts/post.model.dart';
import 'package:arctekko/services/posts/posts.service.dart';
import 'package:arctekko/services/users/auth.service.dart';
import 'package:get/get.dart';

import '../../shared/loading/loading.controller.dart';

class HomeController extends GetxController {
  RxList<Post> _posts = List<Post>().obs;

  List<Post> get posts => _posts;

  String get appbarTitle => 'Hello, ${AuthService.getUser().name}';

  @override
  void onInit() async {
    final loadingController = Get.find<LoadingController>();
    loadingController.isLoading = true;

    _posts.value = await PostsService.getPostsFromLoggedUser();

    loadingController.isLoading = false;
  }

  void logout() async {
    await AuthService.logout();
    Get.offAllNamed('login');
  }
}
