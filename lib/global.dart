import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:my_flutter_mall/common/res/locale.dart';

import 'common/network/dio_config/http/request_repository.dart';
import 'common/res/theme.dart';
import 'common/service/storage.dart';
import 'common/utils/loading.dart';

/// @class: Global
/// @author: hp
/// @updateTime: 2021/11/30 15:35
/// @description: 全局初始化
class Global {
  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    //指定应用程序界面可以显示的方向集
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    //初始化loading
    Loading();
    //初始化存储服务
    await Get.putAsync<StorageService>(() => StorageService().init());
    //初始懒加载主题
    Get.put(AppTheme());
    //初始懒加载语言
    Get.put(AppLocale());
    //初始化dio配置
    initDio();
  }

  ///初始化dio配置
  static void initDio() {
    Get.put(RequestRepository());
  }

  ///设置系统状态栏和底部导航栏
  static void setSystemUi(bool userDarkMode) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: userDarkMode ? Brightness.light : Brightness.dark,
      statusBarIconBrightness: userDarkMode ? Brightness.light : Brightness.dark,
      // systemNavigationBarDividerColor: Colors.white.withOpacity(0.1),
      systemNavigationBarColor: userDarkMode ? Colors.grey[850] : Colors.grey[50],
      systemNavigationBarIconBrightness: userDarkMode ? Brightness.light : Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
