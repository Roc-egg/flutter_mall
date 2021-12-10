import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'zh_CN.dart';
import 'en_US.dart';

class TranslationService extends Translations {
  static Locale get locale => Get.deviceLocale ?? Locale('zh', 'CN');
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zh_CN,
        'en_US': en_US,
      };
}
