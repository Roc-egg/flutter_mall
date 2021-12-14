import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../category_logic.dart';

/// @class: LeftWidget
/// @author: hp
/// @updateTime: 2021/12/14 11:27
/// @description: 左边一级分类列表视图
class LeftWidget extends StatelessWidget {
  LeftWidget({Key? key}) : super(key: key);

  final logic = Get.find<CategoryLogic>();
  final state = Get.find<CategoryLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          itemCount: state.categoryList.length,
          itemBuilder: (context, index) => _LeftItemWidget(index),
        ));
  }
}

/// @description: 左边item视图
class _LeftItemWidget extends StatelessWidget {
  _LeftItemWidget(this.index, {Key? key}) : super(key: key);

  final logic = Get.find<CategoryLogic>();
  final state = Get.find<CategoryLogic>().state;

  final int index;

  @override
  Widget build(BuildContext context) {
    var accentColor = Theme.of(context).accentColor;

    return InkWell(
      onTap: () {
        state.selectIndex = index;
        state.id = state.categoryList[index].id ?? -1;
        logic.getCategoryData();
      },
      child: Obx(() {
        var isSelect = state.selectIndex == index;
        return Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(child: Container(width: 3, color: accentColor), visible: isSelect),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(state.categoryList[index].name ?? '',
                      style: TextStyle(fontSize: isSelect ? 20 : 15, color: isSelect ? accentColor : null)),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
