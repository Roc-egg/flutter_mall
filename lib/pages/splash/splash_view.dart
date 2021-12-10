import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/res/r.dart';
import 'package:my_flutter_mall/pages/splash/widgets/splash_anim_widget.dart';

import '../../global.dart';
import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  final logic = Get.find<SplashLogic>();
  final state = Get.find<SplashLogic>().state;

  @override
  Widget build(BuildContext context) {
    //设置系统状态栏
    Global.setSystemUi(Get.theme.brightness == Brightness.dark);
    ///预缓存背景图片
    precacheImage(AssetImage(R.assetsImagesLoginBackground), context);

    return Scaffold(
      body: SplashAnimWidget(),
    );
  }
}