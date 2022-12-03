import 'package:book_bank/app/modules/home/controllers/settings_controller.dart';
import 'package:get/get.dart';

import '../../cart/controllers/cart_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
    );
    Get.put<SettingsController>(
      SettingsController(),
    );
    Get.put<CartController>(
      CartController(),
    );
  }
}
