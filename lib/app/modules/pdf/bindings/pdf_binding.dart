import 'package:get/get.dart';

import '../controllers/pdf_controller.dart';

class PdfBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfController>(
      () => PdfController(),
    );
  }
}
