import 'package:get/get.dart';
import 'package:my_flutter_mall/pages/main/main_binding.dart';
import 'package:my_flutter_mall/pages/main/main_view.dart';
import 'package:my_flutter_mall/pages/my/setting/setting_binding.dart';
import 'package:my_flutter_mall/pages/my/setting/setting_view.dart';
import 'package:my_flutter_mall/pages/splash/splash_binding.dart';
import 'package:my_flutter_mall/pages/splash/splash_view.dart';

/// @class: Routes
/// @author: hp
/// @updateTime: 2021/11/30 15:39
/// @description: 页面路由管理
abstract class Routes {
  ///入口splash页面
  static const String splashPage = '/splash';

  ///主页
  static const String mainPage = '/main';

  ///设置页
  static const String settingPage = '/setting';

  ///登录模块
  static const String loginPage = '/login';

  ///注册
  static const String registerPage = '/register';

  ///webView
  static const String webViewPage = '/webView';

  ///入口模块
  static const String feedbackPage = '/feedback';

  ///用户信息模块
  static const String userInfoPage = '/userInfo';

  ///积分排行榜
  static const String rankingPage = '/ranking';

  ///关于我们
  static const String aboutPage = '/about';

  ///积分明细
  static const String pointsPage = '/points';

  ///语言
  static const String settingLanguagePage = '/language';

  ///我的收藏
  static const String collectPage = '/collect';

  ///搜索页面
  static const String searchPage = '/search';

  ///浏览记录
  static const String historyPage = '/history';

  ///分享页面
  static const String sharePage = '/share';

  ///页面合集
  static final routePage = [
    GetPage(name: splashPage, page: () => SplashPage(), binding: SplashBinding()),
    GetPage(name: mainPage, page: () => const MainPage(), binding: MainBinding()),
    GetPage(name: settingPage, page: () => SettingPage(), binding: SettingBinding()),
  ];
}
