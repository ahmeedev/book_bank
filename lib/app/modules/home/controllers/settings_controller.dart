import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../main.dart';

class SettingsController extends GetxController {
  var isSingIn = false.obs;
  var isSeller = false.obs;
  var userName = 'User Name'.obs;
  var userEmail = 'userEmail@gmail.com'.obs;

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        isSingIn.value = false;
        userName.value = 'User Name';
        userEmail.value = 'userEmail@gmail.com';
        logger.e(
          'User is currently signed out!',
        );
      } else {
        isSingIn.value = true;
        final result = await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get();
        isSeller.value = result['isSeller'] ?? false;
        userName.value =
            FirebaseAuth.instance.currentUser!.displayName ?? 'User Name';
        if (userName.value.isEmpty) {
          userName.value = 'User Name';
        }
        userEmail.value = FirebaseAuth.instance.currentUser!.email!;
        logger.e('User is signed in!');
      }
    });
    super.onInit();
  }
}
