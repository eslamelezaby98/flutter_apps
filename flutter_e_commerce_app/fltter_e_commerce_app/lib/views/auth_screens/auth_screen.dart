import 'package:fltter_e_commerce_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: controller.cureentIndexOfTab,
      length: controller.authScreens.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('E-Commerce'),
          bottom: TabBar(
            onTap: controller.onTap,
            tabs: [
              Text(
                'Register',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                'Login',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        body: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (controller) =>
              controller.authScreens.elementAt(controller.cureentIndexOfTab),
        ),
      ),
    );
  }
}
