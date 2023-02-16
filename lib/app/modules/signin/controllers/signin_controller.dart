import 'dart:developer';

import 'package:book_bank/app/modules/home/controllers/settings_controller.dart';
import 'package:book_bank/app/modules/signin/Models/signin_model.dart';
import 'package:book_bank/app/utilities/get_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../main.dart';

class SigninController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var rememberValue = false.obs;
  void login(String email, String password) async {
    if (rememberValue.value) {
      SignModel controller = SignModel(email: email, password: password);
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: controller.email, password: controller.password);
      log("Result is $result", name: "SIGNIN");
      Get.back();

      final re = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      Get.find<SettingsController>().isSeller.value = re['isSeller'] ?? false;
      Get.back();
      showSnackBar(title: "Auth", description: "Sign in Successfully");
    } else {
      logger.e("Press on recaptcha button to continue");
      showSnackBar(
          title: "Error!", description: 'Click on recaptha button to continue');
    }
    //   try {
    //     if (email.isNotEmpty && password.isNotEmpty) {
    //       await FirebaseAuth.instance
    //           .signInWithEmailAndPassword(email: email, password: password);
    //     } else {
    //       Get.snackbar("Error Logging In", "Please enter all the fields");
    //     }
    //   } catch (e) {
    //     Get.snackbar("Error Logging In", e.toString());
    //   }
  }
}
