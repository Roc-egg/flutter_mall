import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/res/colors.dart';
import 'package:my_flutter_mall/common/utils/toast_util.dart';
import 'package:my_flutter_mall/model/home_mode.dart';

import '../home_logic.dart';

/// @class: HotGoodsWidget
/// @author: hp
/// @updateTime: 2021/12/9 18:09
/// @description: 人气推荐专区视图
class HotGoodsWidget extends StatelessWidget {
  HotGoodsWidget({Key? key}) : super(key: key);

  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return InkWell(
              onTap: () {
                ToastUtils.show("点击了${state.hotGoodsList[index].name}");
              },
              child: _HotGoodsItemWidget(state.hotGoodsList[index]));
        }, childCount: state.hotGoodsList.length)));
  }
}

class _HotGoodsItemWidget extends StatelessWidget {
  final HotGoodsList hotGoodsList;

  const _HotGoodsItemWidget(this.hotGoodsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(height: 1.5, indent: 15, endIndent: 15),
        Row(
          children: [
            //左侧图片
            Flexible(
              //设置权重对应CouponShapeBorder中的虚线位置比例
                flex: 3,
                //设置占满权重的全部空间
                fit: FlexFit.tight,
                child: CachedNetworkImage(
                  imageUrl: hotGoodsList.picUrl ?? "",
                  fit: BoxFit.fill,
                )),
            //右边文字视图
            Flexible(
              //设置权重对应CouponShapeBorder中的虚线位置比例
              flex: 7,
              //设置占满权重的全部空间
              fit: FlexFit.tight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(hotGoodsList.name ?? "",style: Theme.of(context).textTheme.subtitle2),
                  SizedBox(height: 5),
                  Text(hotGoodsList.brief ?? "",style: Theme.of(context).textTheme.caption),
                  SizedBox(height: 5),
                  Text("¥${Decimal.parse(hotGoodsList.retailPrice.toString())}",style: Theme.of(context).textTheme.subtitle2?.copyWith(color: ColorStyle.color_orange_700))
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
