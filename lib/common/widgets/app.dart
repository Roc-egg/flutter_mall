import 'package:flutter/material.dart';

/// 通用AppBar
AppBar MyAppBar({
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
    centerTitle: true,
    leading: leading,
    actions: actions,
    backgroundColor: backgroundColor,
  );
}
