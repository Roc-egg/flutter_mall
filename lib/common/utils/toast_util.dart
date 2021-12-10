import 'package:oktoast/oktoast.dart';

/// @class: ToastUtils
/// @author: hp
/// @updateTime: 2021/12/1 11:04
/// @description: Toast工具类
class ToastUtils {
  /// 显示toast
  ///[name] lottie名称
  static show(String name) {
    dismissAllToast();
    showToast(
      name,
      position: ToastPosition.bottom,
    );
  }
}
