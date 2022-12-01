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
}
