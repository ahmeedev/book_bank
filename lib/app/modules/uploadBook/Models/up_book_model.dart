import 'package:cloud_firestore/cloud_firestore.dart';

class UploadModel {
  String bookName;
  String authur;
  String description;
  int price;

  UploadModel(
      {required this.bookName,
      required this.authur,
      required this.description,
      required this.price});

  //App - Firebase(Map)
  Map<String, dynamic> toJson() => {
        "bookName": bookName,
        "description": description,
        "price": price,
        "authur": authur
      };

  //Firebase(Map) - App(User)
  static UploadModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UploadModel(
        bookName: snapshot['email'],
        authur: snapshot["profilePic"],
        price: snapshot["uid"],
        description: snapshot["name"]);
  }
}
