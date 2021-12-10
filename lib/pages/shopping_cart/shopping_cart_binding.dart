import 'package:get/get.dart';

import 'shopping_cart_logic.dart';

class ShoppingCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShoppingCartLogic());
  }
}
