import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

/// @class : Styles
/// @name : jhf
/// @description :样式文件
class Styles {

  ///---------------------------白色字体区域-------------------------------
  static const TextStyle style_white_10 =
      TextStyle(color: Colors.white, fontSize: 10 ,height: 1.1);
  static const TextStyle style_white_12 =
      TextStyle(color: Colors.white, fontSize: 12);
  static const TextStyle style_white_14 =
      TextStyle(color: Colors.white, fontSize: 14);
  static const TextStyle style_white_16 =
      TextStyle(color: Colors.white, fontSize: 16);
  static const TextStyle style_white_18 =
      TextStyle(color: Colors.white, fontSize: 18);
  static const TextStyle style_white_16_bold =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700);
  static const TextStyle style_white24_18 =
      TextStyle(color: Colors.white24, fontSize: 18);
  static const TextStyle style_white_36 =
      TextStyle(color: Colors.white, fontSize: 36);
  ///---------------------------黑色字体区域-------------------------------
  static const TextStyle style_black_18_bold =
      TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700);
  static const TextStyle style_black_18_bold500 =
      TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
  static const TextStyle style_black_16_bold =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700);
  static const TextStyle style_black_16_bold500 =
      TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
  static const TextStyle style_black_14 =
      TextStyle(color: Colors.black, fontSize: 14);
  static const TextStyle style_black_16 =
      TextStyle(color: Colors.black, fontSize: 16);
  static const TextStyle style_black_36 =
      TextStyle(color: Colors.black, fontSize: 36);
  static const TextStyle style_black_30 =
      TextStyle(color: Colors.black, fontSize: 30);
  static const TextStyle style_black_12 =
      TextStyle(color: Colors.black, fontSize: 12);
  static const TextStyle style_black_13 =
      TextStyle(color: Colors.black, fontSize: 13);
  static const TextStyle style_black_15 =
      TextStyle(color: Colors.black, fontSize: 15);


}

/// 间隔
class Box {
  /// 水平间隔
  static Widget hBox3 = const SizedBox(width: 3);
  static Widget hBox5 = const SizedBox(width: 5);
  static Widget hBox6 = const SizedBox(width: 6);
  static Widget hBox10 = const SizedBox(width: 10);
  static Widget hBox12 = const SizedBox(width: 12);
  static Widget hBox15 = const SizedBox(width: 15);
  static Widget hBox20 = const SizedBox(width: 20);
  static Widget hBox30 = const SizedBox(width: 30);

  /// 垂直间隔
  static Widget vBox3 = const SizedBox(height: 3);
  static Widget vBox5 = const SizedBox(height: 5);
  static Widget vBox10 = const SizedBox(height: 10);
  static Widget vBox12 = const SizedBox(height: 12);
  static Widget vBox15 = const SizedBox(height: 15);
  static Widget vBox20 = const SizedBox(height: 20);
  static Widget vBox30 = const SizedBox(height: 30);
  static Widget vBox50 = const SizedBox(height: 50);

  static Widget getHGap(double w) {
    return SizedBox(width: w);
  }

  static Widget getVGap(double h) {
    return SizedBox(height: h);
  }
}

class DividerStyle {
  ///分割线 0.5 - 20边距
  static Widget divider1HalfPadding20 = const Divider(
    height: 0.5,
    thickness: 0.5,
    indent: 20,
    endIndent: 20,
    // color: ColorStyle.colorShadow,
  );

  ///分割线 0.5 - 无边距
  static Widget divider1Half = const Divider(
    height: 0.5,
    thickness: 0.5,
    // color: ColorStyle.colorShadow,
  );

  ///分割线 20 - 无边距
  static Widget divider20Half = const Divider(
    height: 20,
    thickness: 20,
    // color: ColorStyle.color_F8F9FC,
  );
}
