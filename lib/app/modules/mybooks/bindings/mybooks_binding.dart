import 'package:get/get.dart';

import '../controllers/mybooks_controller.dart';

class MybooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MybooksController>(
      () => MybooksController(),
    );
  }
}
