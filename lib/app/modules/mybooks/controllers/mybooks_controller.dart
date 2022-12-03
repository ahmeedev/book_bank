import 'package:book_bank/app/modules/home/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class MybooksController extends GetxController {
  late Future myBooksFuture;
  final List<MyBook> myBooks = <MyBook>[];

  @override
  void onInit() {
    myBooksFuture = _getMyBooksFromFirebase();
    super.onInit();
  }

  _getMyBooksFromFirebase() async {
    final db = FirebaseFirestore.instance;

    final docRef =
        db.collection("books").doc(FirebaseAuth.instance.currentUser!.uid);
    final data = await docRef.get();
    data.data()!.forEach((key, value) {
      print(key);
      print(value);
      final book = MyBook(
        name: key,
        authur: value['authur'],
        description: value['description'],
        image: value['image'],
        price: value['price'],
      );
      myBooks.add(book);
      print(myBooks);
    });

    return Future.value(myBooks);
  }
}
