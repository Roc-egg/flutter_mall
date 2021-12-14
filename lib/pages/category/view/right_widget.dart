import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/utils/toast_util.dart';
import 'package:my_flutter_mall/model/category_mode.dart';

import '../category_logic.dart';

/// @class: RightWidget
/// @author: hp
/// @updateTime: 2021/12/14 10:07
/// @description: 分类右边视图
class RightWidget extends StatelessWidget {
  RightWidget({Key? key}) : super(key: key);

  final state = Get.find<CategoryLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, right: 5, bottom: 10),
            child: CachedNetworkImage(imageUrl: state.currentCategory.value.picUrl ?? '', height: 130, fit: BoxFit.cover),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(margin: EdgeInsets.only(right: 5), width: 30, height: 1, color: Theme.of(context).dividerColor),
              Text('goodsCategory'.trArgs([state.currentCategory.value.name ?? '']), style: TextStyle(fontSize: 14)),
              Container(margin: EdgeInsets.only(left: 5), width: 30, height: 1, color: Theme.of(context).dividerColor),
            ],
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8),
              itemBuilder: (content, index) => InkWell(
                onTap: () {
                  ToastUtils.show("点击了${state.currentSubCategory[index].name}");
                },
                child: _GridViewItem(state.currentSubCategory[index]),
              ),
              itemCount: state.currentSubCategory.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _GridViewItem extends StatelessWidget {
  final CurrentSubCategory currentSubCategory;

  const _GridViewItem(this.currentSubCategory, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(imageUrl: currentSubCategory.picUrl ?? ''),
        SizedBox(height: 3),
        Text(currentSubCategory.name ?? '', style: TextStyle(fontSize: 15)),
      ],
    );
  }
}
