import 'package:book_bank/app/modules/home/models/book_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <MyBook>[].obs;
  var totalPrice = 0;

  Future calculateTotalPrices() {
    totalPrice = 0;
    for (var element in cartItems) {
      totalPrice += element.price;
      print(totalPrice);
    }
    return Future.value(totalPrice);
  }
}
