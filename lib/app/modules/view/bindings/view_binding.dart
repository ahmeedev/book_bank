import 'package:get/get.dart';

import '../controllers/view_controller.dart';

class ViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewController>(
      () => ViewController(),
    );
  }
}
