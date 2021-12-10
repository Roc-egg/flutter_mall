import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shopping_cart_logic.dart';

class ShoppingCartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ShoppingCartLogic>();
    final state = Get.find<ShoppingCartLogic>().state;

    return Container(
      alignment: Alignment.center,
      child: Text('homeShoppingCart'.tr),
    );
  }
}
