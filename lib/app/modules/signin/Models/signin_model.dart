// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class SignModel {
  String email;
  String password;

  SignModel({required this.email, required this.password});

  //App - Firebase(Map)
  Map<String, dynamic> toJson() => {"email": email, "uid": password};

  //Firebase(Map) - App(User)
  static SignModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return SignModel(
      email: snapshot['email'],
      password: snapshot["uid"],
    );
  }
}
