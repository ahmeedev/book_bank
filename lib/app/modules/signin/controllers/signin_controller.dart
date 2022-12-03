import 'dart:developer';

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
    final result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: "jia@gmail.com", password: "jia123");
    log("Result is $result", name: "SIGNIN");
    Get.back();
    showSnackBar(title: "Auth", description: "Sign in Successfully");
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
