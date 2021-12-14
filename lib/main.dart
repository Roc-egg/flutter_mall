import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:my_flutter_mall/routes/routes.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'common/res/language/translation_service.dart';
import 'common/res/theme.dart';
import 'common/utils/keyboard_utils.dart';
import 'common/widgets/refresh_helper.dart';
import 'global.dart';

/// @class: main
/// @author: hp
/// @updateTime: 2021/11/23 14:56
/// @description: app main入口
void main() async {
  await Global.init();
  runApp(MyApp());
  //设置系统状态栏
  Global.setSystemUi(Get.theme.brightness == Brightness.dark);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => RefreshConfiguration(
          // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
          headerBuilder: () => HomeRefreshHeader(),
          // 配置默认底部指示器
          footerBuilder: () => RefresherFooter(),
          // 头部触发刷新的越界距离
          headerTriggerDistance: 80.0,
          // 自定义回弹动画,三个属性值意义请查询flutter api
          springDescription: SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
          //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
          maxOverScrollExtent: 1000,
          // 底部最大可以拖动的范围
          maxUnderScrollExtent: 0,
          //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
          enableScrollWhenRefreshCompleted: true,
          //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
          enableLoadingWhenFailed: true,
          // Viewport不满一屏时,禁用上拉加载更多功能
          hideFooterWhenNotFull: false,
          // 可以通过惯性滑动触发加载更多
          enableBallisticLoad: true,
          footerTriggerDistance: 150,
          child:
          // ColorFiltered(//灰色app 可以通过服务器下发参数设置为Colors.grey 或者 Colors.transparent
          //   colorFilter: ColorFilter.mode(Colors.grey, BlendMode.color),
          //   child:
            GetMaterialApp(
              /// 解决在web端有滑动时，鼠标无法上下左右拖动问题
              scrollBehavior: MyCustomScrollBehavior(),
              debugShowCheckedModeBanner: true,
              initialRoute: Routes.splashPage,
              getPages: Routes.routePage,
              builder: EasyLoading.init(
                  builder: (context, child) => Scaffold(
                    // Global GestureDetector that will dismiss the keyboard
                    body: GestureDetector(
                      onTap: () {
                        KeyboardUtils.hideKeyboard(context);
                      },
                      child: child,
                    ),
                  )),

              ///主题样式
              theme: AppTheme.to.themeData(),

              ///黑暗主题样式
              darkTheme: AppTheme.to.themeData(),

              ///目前看来必须设置，不设置会出现系统暗黑模式下，切换主题错乱问题
              themeMode: ThemeMode.light,

              ///国际化支持-来源配置
              translations: TranslationService(),

              ///国际化支持-默认语言
              locale: TranslationService.locale,

              ///国际化支持-备用语言
              fallbackLocale: TranslationService.fallbackLocale,

              defaultTransition: Transition.fade,
            ),
          // )

        ),
      ),
    );
  }
}

/// 解决在web端有滑动时，鼠标无法上下左右拖动问题
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
