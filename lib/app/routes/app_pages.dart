import 'package:get/get.dart';

import '../modules/buybook/bindings/buybook_binding.dart';
import '../modules/buybook/views/buybook_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mybooks/bindings/mybooks_binding.dart';
import '../modules/mybooks/views/mybooks_view.dart';
import '../modules/pdf/bindings/pdf_binding.dart';
import '../modules/pdf/views/pdf_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

// ignore_for_file: prefer_const_constructors

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

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
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.PDF,
      page: () => const PdfView(),
      binding: PdfBinding(),
    ),
    GetPage(
      name: _Paths.MYBOOKS,
      page: () => const MybooksView(),
      binding: MybooksBinding(),
    ),
    GetPage(
      name: _Paths.BUYBOOK,
      page: () => const BuybookView(),
      binding: BuybookBinding(),
    ),
  ];
}
