import 'package:get/get.dart';

import '../controllers/buybook_controller.dart';

class BuybookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuybookController>(
      () => BuybookController(),
    );
  }
}
