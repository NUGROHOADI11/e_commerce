import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/images/login.jpg', width: 100, height: 200,)
        ],)
      ),
    );
  }
}
