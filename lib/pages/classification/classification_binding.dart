import 'package:get/get.dart';

import 'classification_logic.dart';

class ClassificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClassificationLogic());
  }
}
