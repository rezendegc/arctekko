import 'package:arctekko/services/posts/post.model.dart';
import 'package:arctekko/services/posts/posts.service.dart';
import 'package:get/get.dart';

import '../../shared/loading/loading.controller.dart';

class HomeController extends GetxController {
  RxList<Post> _posts = List<Post>().obs;

  List<Post> get posts => _posts;

  @override
  void onInit() async {
    final loadingController = Get.find<LoadingController>();
    loadingController.isLoading = true;

    _posts.value = await PostsService.getPostsFromLoggedUser();

    loadingController.isLoading = false;
  }
}
