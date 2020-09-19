import 'package:arctekko/infrastructure/translate/login.translate.dart';
import 'package:arctekko/presentation/screens/login/login.controller.dart';
import 'package:arctekko/presentation/shared/button/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/loading/base.widget.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LoginTranslate.appBar),
      ),
      body: BaseWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Tip: use "Samantha" as login'),
              Obx(() => Text(controller.errorMessage)),
              TextField(
                onChanged: controller.onUsernameInputChange,
              ),
              DefaultButton(
                onTap: controller.onLogin,
                text: LoginTranslate.login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
