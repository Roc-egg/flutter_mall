import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:my_flutter_mall/common/res/r.dart';
import 'package:my_flutter_mall/routes/routes.dart';

import '../splash_logic.dart';

class SplashAnimWidget extends StatefulWidget {
  @override
  _SplashAnimWidgetState createState() => _SplashAnimWidgetState();
}

class _SplashAnimWidgetState extends State<SplashAnimWidget> with SingleTickerProviderStateMixin {
  final logic = Get.find<SplashLogic>();
  final state = Get.find<SplashLogic>().state;

  @override
  Widget build(BuildContext context) {
    logic.controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    //动画开始、结束、向前移动或向后移动时会调用StatusListener
    logic.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        Get.offNamed(Routes.mainPage);
      }
    });

    //动画开始
    logic.controller.forward();

    return buildSlideTransition();
  }

  @override
  void dispose() {
    Get.delete<SplashLogic>();
    logic.controller.dispose();
    super.dispose();
  }

  //渐变动画
  Widget buildSlideTransition() {
    return FadeTransition(
      opacity: logic.controller,
      //动画内容
      child: Container(
        margin: const EdgeInsets.only(top: 130),
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.asset(
              R.assetsImagesApplication,
              fit: BoxFit.fill,
              width: 120,
              height: 120,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'appName'.tr,
                style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 36),
              ),
            )
          ],
        ),
      ),
    );
  }
}
