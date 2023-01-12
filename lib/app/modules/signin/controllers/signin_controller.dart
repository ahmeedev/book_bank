import 'dart:developer';

import 'package:book_bank/app/modules/signin/Models/signin_model.dart';
import 'package:book_bank/app/utilities/get_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      showSnackBar(title: "Auth", description: "Sign in Successfully");
    } else {
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
