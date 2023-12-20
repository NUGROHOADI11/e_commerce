import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'other_product_controller.dart';

class OtherProductView extends GetView<OtherProductController> {
  const OtherProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OtherProductView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OtherProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
