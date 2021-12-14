import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @class: SliverDivider
/// @author: hp
/// @updateTime: 2021/12/8 11:32
/// @description: 首页分区标题
class SliverTitleDivider extends StatelessWidget {
  ///数据集合
  final RxList list;

  ///分区标题
  final String title;

  ///分区分割线Divider高度
  final double height;

  ///标题背景颜色
  final Color? titleBgColor;

  SliverTitleDivider({Key? key, required this.list, required this.title, required this.height, this.titleBgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverToBoxAdapter(
        child: Visibility(
            visible: list.isNotEmpty,
            child: Column(
              children: [
                Divider(thickness: height, height: height, color: Theme.of(context).dividerColor.withOpacity(0.05)),
                Container(
                  color: titleBgColor ?? Theme.of(context).scaffoldBackgroundColor,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(title, style: TextStyle().copyWith(fontSize: 17)),
                ),
              ],
            ))));
  }
}
