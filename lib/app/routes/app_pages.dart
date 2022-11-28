import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pdf/bindings/pdf_binding.dart';
import '../modules/pdf/views/pdf_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/view/bindings/view_binding.dart';
import '../modules/view/views/view_view.dart';

// ignore_for_file: prefer_const_constructors

part 'app_routes.dart';

class AppPages {
  _setInitialView(User? user) async {
    if (user == null) {
      await Future.delayed(const Duration(seconds: 5));

      Get.toNamed(Routes.SIGNIN);
    } else {
      await Future.delayed(const Duration(seconds: 5));
      Get.toNamed(Routes.VIEW);
    }
  }

  AppPages._();

  static const INITIAL = Routes.VIEW;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.VIEW,
      page: () => ViewView(),
      binding: ViewBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.PDF,
      page: () => const PdfView(),
      binding: PdfBinding(),
    ),
  ];
}
