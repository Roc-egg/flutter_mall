import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

/// @class: GetExtension
/// @author: hp
/// @updateTime: 2021/12/6 10:25
/// @description: get 扩展方法
extension GetDialogExtension on GetInterface {
  ///隐藏dialog
  dismiss() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  ///显示dialog
  showLoading({String text = ''}) {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
    EasyLoading.show(
        status: text.isEmpty ? 'loading'.tr : text, maskType: EasyLoadingMaskType.clear);
  }
}
