import 'package:get/get.dart';
import 'package:my_flutter_mall/pages/classification/classification_logic.dart';
import 'package:my_flutter_mall/pages/home/home_logic.dart';
import 'package:my_flutter_mall/pages/my/my_logic.dart';
import 'package:my_flutter_mall/pages/shopping_cart/shopping_cart_logic.dart';

import 'main_logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => ClassificationLogic());
    Get.lazyPut(() => ShoppingCartLogic());
    Get.lazyPut(() => MyLogic());
  }
}
