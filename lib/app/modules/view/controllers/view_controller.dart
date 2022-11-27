// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import '../../cart/views/cart_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';

class ViewController extends GetxController {
  //TODO: Implement ViewController

  final count = 0.obs;

  void increment() => count.value++;

  var pageIndex = [
    HomeView(),
    CartView(),
    ProfileView(),
  ];
}
