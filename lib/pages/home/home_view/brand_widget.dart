import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/utils/toast_util.dart';
import 'package:my_flutter_mall/model/home_mode.dart';

import '../home_logic.dart';

/// @class: BrandWidget
/// @author: hp
/// @updateTime: 2021/12/9 17:10
/// @description: 品牌制造商专区视图
class BrandWidget extends StatelessWidget {
  BrandWidget({Key? key}) : super(key: key);

  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.79, mainAxisSpacing: 1, crossAxisSpacing: 1),
        delegate: SliverChildBuilderDelegate((content, index) {
          return InkWell(
            onTap: () {
              ToastUtils.show("点击了${state.brandList[index].name}");
            },
            child: _BrandItemWidget(state.brandList[index]),
          );
        }, childCount: state.brandList.length)));
  }
}

class _BrandItemWidget extends StatelessWidget {
  final BrandList brandList;

  const _BrandItemWidget(this.brandList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(imageUrl: brandList.picUrl ?? "", fit: BoxFit.fill),
        Container(
          margin: EdgeInsets.only(top: 12, left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(brandList.name ?? '', style: TextStyle(color: Colors.white, fontSize: 16)),
              Text('yuanQi'.trArgs([Decimal.parse(brandList.floorPrice.toString()).toString()]), style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        )
      ],
    );
  }
}
