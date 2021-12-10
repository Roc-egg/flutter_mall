import 'package:flutter/material.dart';

/// 通用透明背景 AppBar
AppBar transparentAppBar({
  Widget? title,
  Widget? leading,
  List<Widget>? actions,
  Color? backgroundColor,
}) {
  return AppBar(
    title: title != null
        ? Center(
            child: title,
          )
        : null,
    leading: leading,
    actions: actions,
    backgroundColor: backgroundColor,
  );
}
