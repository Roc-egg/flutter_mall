import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/res/colors.dart';
import 'package:my_flutter_mall/common/utils/toast_util.dart';
import 'package:my_flutter_mall/model/home_mode.dart';

import '../home_logic.dart';

/// @class: GrouponWidget
/// @author: hp
/// @updateTime: 2021/12/9 13:44
/// @description: 团购专区视图
class GrouponWidget extends StatelessWidget {
  GrouponWidget({Key? key}) : super(key: key);

  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return InkWell(
              onTap: () {
                ToastUtils.show("点击了${state.grouponList[index].name}");
              },
              child: _GrouponItemWidget(state.grouponList[index]));
        }, childCount: state.grouponList.length)));
  }
}

class _GrouponItemWidget extends StatelessWidget {
  final GrouponList grouponList;

  _GrouponItemWidget(this.grouponList, {Key? key}) : super(key: key);

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
                  imageUrl: grouponList.picUrl ?? "",
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
                  Row(children: [
                    Text(grouponList.name ?? ""),
                    Container(
                      padding: EdgeInsets.fromLTRB(2, 1, 2, 1),
                      decoration:
                          BoxDecoration(color: Theme.of(context).accentColor.withOpacity(0.6), borderRadius: BorderRadius.all(Radius.circular(3.0))),
                      child: Text('grouponMember'.trArgs([grouponList.grouponMember.toString()]),
                          style: TextStyle(fontSize: 8, color: Colors.white.withOpacity(0.9))),
                    ),
                  ]),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
                    decoration: BoxDecoration(color: Colors.orange[400], borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Text('validUntil'.trArgs([grouponList.expireTime ?? '-']),
                        style: TextStyle(fontSize: 8, color: Colors.white.withOpacity(0.9))),
                  ),
                  SizedBox(height: 5),
                  Text(grouponList.brief ?? "", style: Theme.of(context).textTheme.caption),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Text('presentPrice'.trArgs([Decimal.parse(grouponList.retailPrice.toString()).toString()]),
                          style: Theme.of(context).textTheme.caption?.copyWith(decoration: TextDecoration.lineThrough, fontSize: 14)),
                      SizedBox(width: 5),
                      Text('groupPurchasePrice'.trArgs([Decimal.parse(grouponList.grouponPrice.toString()).toString()]),
                          style: Theme.of(context).textTheme.caption?.copyWith(color: ColorStyle.color_orange_700, fontSize: 14)),
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
