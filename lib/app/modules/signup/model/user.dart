// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String email;
  String uid;

  myUser({required this.name, required this.email, required this.uid});

  //App - Firebase(Map)
  Map<String, dynamic> toJson() => {"name": name, "email": email, "uid": uid};

  //Firebase(Map) - App(User)
  static myUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
        email: snapshot['email'], uid: snapshot["uid"], name: snapshot["name"]);
  }
}
