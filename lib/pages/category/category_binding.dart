import 'package:get/get.dart';

import 'category_logic.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryLogic());
  }
}
