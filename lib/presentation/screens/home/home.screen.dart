import 'package:arctekko/presentation/screens/home/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() {
        return ListView.separated(
          itemBuilder: (_, index) {
            return Column(
              children: [
                Text(controller.posts[index].title),
                const SizedBox(height: 5),
                Text(controller.posts[index].body),
              ],
            );
          },
          separatorBuilder: (_, index) {
            return Divider();
          },
          itemCount: controller.posts.length,
        );
      }),
    );
  }
}
