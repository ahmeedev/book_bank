import 'package:book_bank/app/modules/signup/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final count = 0.obs;

  final formKey = GlobalKey<FormState>();
  var rememberValue = false.obs;

  final radioButtonGroup = "seller".obs;

  void signUp(
    String username,
    String email,
    String password,
  ) async {
    myUser user = myUser(
      name: username,
      email: email,
      password: password,
    );

    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    if (radioButtonGroup == 'seller') {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({"isSeller": true});
    } else {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({"isSeller": false});
    }
  }
}
