import 'package:book_bank/app/modules/home/models/book_model.dart';
import 'package:book_bank/app/utilities/get_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../main.dart';

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

  final isPaymentDone = false.obs;
  Future<void> buyAll() async {
    final isAuthenticated = FirebaseAuth.instance.currentUser;
    if (isAuthenticated != null) {
      final result = await http.post(
          Uri.parse(
              'https://sandbox.jazzcash.com.pk/ApplicationAPI/API/Payment/DoTransaction'),
          body: {
            "pp_Version": "1.1",
            "pp_TxnType": "MWALLET",
            "pp_Language": "EN",
            "pp_MerchantID": "Merc0003",
            "pp_SubMerchantID": "",
            "pp_Password": "0123456789",
            "pp_BankID": "",
            "pp_ProductID": "",
            "pp_TxnRefNo": "",
            "pp_Amount": "10000",
            "pp_TxnCurrency": "PKR",
            "pp_TxnDateTime": "",
            "pp_BillReference": "billref",
            "pp_Description": "Description of transaction",
            "pp_TxnExpiryDateTime": "",
            "pp_ReturnURL":
                "https://sandbox.jazzcash.com.pk/MerchantSimulator/HttpRequestDemoServer/Index",
            "pp_SecureHash": "",
            "ppmpf_1": "",
            "ppmpf_2": "",
            "ppmpf_3": "",
            "ppmpf_4": "",
            "ppmpf_5": ""
          });
      final response = result.body;
      if (result.statusCode == 200) {
        logger.i(response);
        isPaymentDone.value = true;
        showSnackBar(
            title: "Success", description: "Your payment is done successfully");
      }
    } else {
      showSnackBar(title: "Error", description: "You must be login first");
    }
  }
}
