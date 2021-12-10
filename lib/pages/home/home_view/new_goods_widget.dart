import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/utils/toast_util.dart';
import 'package:my_flutter_mall/model/home_mode.dart';

import '../home_logic.dart';

/// @class: NewGoodsWidget
/// @author: hp
/// @updateTime: 2021/12/9 17:39
/// @description: 新品首发专区视图
class NewGoodsWidget extends StatelessWidget {
  NewGoodsWidget({Key? key}) : super(key: key);

  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:0.8),
        delegate: SliverChildBuilderDelegate((content, index) {
          return InkWell(
            onTap: () {
              ToastUtils.show("点击了${state.newGoodsList[index].name}");
            },
            child: _NewGoodsItemWidget(state.newGoodsList[index]),
          );
        }, childCount: state.newGoodsList.length)));
  }
}

class _NewGoodsItemWidget extends StatelessWidget {
  final NewGoodsList newGoodsList;

  const _NewGoodsItemWidget(this.newGoodsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: newGoodsList.picUrl ?? '',
          fit: BoxFit.fill,
        ),
        Text(newGoodsList.name ?? '', style: TextStyle(fontSize: 14)),
        Text("¥${Decimal.parse(newGoodsList.retailPrice.toString())}", style: TextStyle(fontSize: 14,color: Colors.orange[700])),
      ],
    );
  }
}
