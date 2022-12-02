import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class SettingsController extends GetxController {
  var isSingIn = false.obs;

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        isSingIn.value = false;
        logger.e(
          'User is currently signed out!',
        );
      } else {
        isSingIn.value = true;

        logger.e('User is signed in!');
      }
    });
    super.onInit();
  }
}
