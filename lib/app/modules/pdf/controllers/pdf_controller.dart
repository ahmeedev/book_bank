import 'package:get/get.dart';

class PdfController extends GetxController {
  var showOverlay = false.obs;

  final isFullAccess = Get.arguments["isFullAccess"] ?? false;
}
