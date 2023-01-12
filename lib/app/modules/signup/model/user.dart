// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String email;
  String password;

  myUser({required this.name, required this.email, required this.password});

  //App - Firebase(Map)
  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "uid": password};

  //Firebase(Map) - App(User)
  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
        email: snapshot['email'],
        password: snapshot["uid"],
        name: snapshot["name"]);
  }
}
