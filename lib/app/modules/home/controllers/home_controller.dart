import 'package:book_bank/app/modules/home/models/book_model.dart';
import 'package:book_bank/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var appBartitles = ["Book Bank", "Settings"];
  var bottomAppBarState = {"isHome": true, "isSetting": false}.obs;

  void changeBottomAppBarState(String state) {
    bottomAppBarState.forEach((key, value) {
      bottomAppBarState[key] = false;
    });
    bottomAppBarState[state] = true;
  }

  late final Future<List<MyBook>> booksFuture;
  @override
  void onInit() {
    booksFuture = fetchBooksFromFirebase();

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

    logger.e(books);

    return Future.value(books);
  }
}
