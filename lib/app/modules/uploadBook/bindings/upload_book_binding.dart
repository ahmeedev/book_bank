import 'package:get/get.dart';

import '../controllers/upload_book_controller.dart';

class UploadBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadBookController>(
      () => UploadBookController(),
    );
  }
}
