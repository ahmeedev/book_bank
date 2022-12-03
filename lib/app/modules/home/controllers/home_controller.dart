import 'package:book_bank/app/modules/home/models/book_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var appBartitles = ["Book Bank", "Settings"];
  var bottomAppBarState = {"isHome": true, "isSetting": false}.obs;

  var searchTextFieldController = TextEditingController();

  void changeBottomAppBarState(String state) {
    bottomAppBarState.forEach((key, value) {
      bottomAppBarState[key] = false;
    });
    bottomAppBarState[state] = true;
  }

  var booksFuture = Future<List<MyBook>>(() {
    return [];
  }).obs;

  @override
  void onInit() {
    booksFuture.value = fetchBooksFromFirebase();

    super.onInit();
  }

  final books = <MyBook>[];

  Future<List<MyBook>> fetchBooksFromFirebase() async {
    // first get all the docuemtns from the firebase
    final documents =
        await FirebaseFirestore.instance.collection('books').get();

    // print(documents.docs.toList());
    for (var element in documents.docs) {
      final result = element.data();
      result.forEach((key, value) {
        final myBook = MyBook(
            name: key,
            authur: value['authur'],
            description: value['description'],
            image: value['image'],
            price: value['price']);
        books.add(myBook);
      });
      // print(books);
    }

    return Future.value(books);
  }

  searchBook({required query}) {
    final result = books
        .where((element) =>
            element.name.toLowerCase().contains(query.toString().toLowerCase()))
        .toList();

    booksFuture.value = Future.value(result);
  }
}
