import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'classification_logic.dart';

class ClassificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ClassificationLogic>();
    final state = Get.find<ClassificationLogic>().state;

    return Container(
      alignment: Alignment.center,
      child: Text('homeClassification'.tr),
    );
  }
}
