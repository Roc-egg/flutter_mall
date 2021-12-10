import 'dart:ui';

import 'package:get/get.dart';
import 'package:my_flutter_mall/common/res/language/translation_service.dart';
import 'package:my_flutter_mall/common/service/services.dart';
import 'package:my_flutter_mall/common/values/storage_name.dart';

/// @class: AppLocale
/// @author: hp
/// @updateTime: 2021/12/2 19:20
/// @description: 语言选择类
class AppLocale {
  static AppLocale get to => Get.find();

  List localeValueList = ['', 'zh-CN', 'en-US'];

  late int _localeIndex;

  int get localeIndex => _localeIndex;

  Locale getMyLocale() {
    if (_localeIndex > 0) {
      var value = localeValueList[_localeIndex].split("-");
      return Locale(value[0], value.length == 2 ? value[1] : '');
    }
    // 跟随系统
    return TranslationService.locale;
  }

  AppLocale() {
    _localeIndex = StorageService.to.getInt(LocaleIndex) ?? 0;
  }

  switchLocale(int index) {
    _localeIndex = index;
    Get.updateLocale(getMyLocale());

    StorageService.to.setInt(LocaleIndex, index);
  }

  String localeName(index) {
    switch (index) {
      case 0:
        return 'autoBySystem'.tr;
      case 1:
        return '中文';
      case 2:
        return 'English';
      default:
        return '';
    }
  }
}
