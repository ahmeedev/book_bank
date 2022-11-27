// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import '../../cart/views/cart_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

class ViewController extends GetxController {
  //TODO: Implement ViewController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
