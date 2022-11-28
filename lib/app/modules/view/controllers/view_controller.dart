// ignore_for_file: prefer_const_constructors

import 'package:book_bank/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  _setInitialView(User? user) async {
    if (user == null) {
      await Future.delayed(Duration(seconds: 5));

      Get.toNamed(Routes.SIGNIN);
    } else {
      await Future.delayed(Duration(seconds: 5));
      Get.toNamed(Routes.VIEW);
    }
  }
}
