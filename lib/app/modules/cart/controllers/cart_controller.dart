import 'package:book_bank/app/modules/home/models/book_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final cartItems = <MyBook>[].obs;
  final totalPrice = 100.obs;

  @override
  void onInit() {
    calculateTotalPrices();
    super.onInit();
  }

  calculateTotalPrices() {
    totalPrice.value = 0;
    for (var element in cartItems) {
      totalPrice.value += element.price;
    }
  }
}
