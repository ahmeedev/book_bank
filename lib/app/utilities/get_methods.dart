import 'package:get/get.dart';

showSnackBar({required String title, required String description}) {
  Get.showSnackbar(
    GetSnackBar(
      title: title,
      message: description,
      // backgroundColor: defaultColorScheme.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    ),
  );
}
