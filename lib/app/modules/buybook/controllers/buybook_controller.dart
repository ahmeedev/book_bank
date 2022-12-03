import 'package:book_bank/app/modules/home/models/book_model.dart';
import 'package:get/get.dart';

class BuybookController extends GetxController {
  List<MyBook> buyingItems = Get.arguments['books'];
  var totalPrice = 0;

  Future calculateTotalPrices() {
    totalPrice = 0;
    for (var element in buyingItems) {
      totalPrice += element.price;
      print(totalPrice);
    }
    return Future.value(totalPrice);
  }
}
