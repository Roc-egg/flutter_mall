import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/res/colors.dart';
import 'package:my_flutter_mall/common/utils/toast_util.dart';
import 'package:my_flutter_mall/model/home_mode.dart';

import '../home_logic.dart';

/// @class: FloorGoodsWidget
/// @author: hp
/// @updateTime: 2021/12/10 15:19
/// @description: 底部商品类分区视图
class FloorGoodsWidget extends StatelessWidget {
  FloorGoodsWidget({Key? key}) : super(key: key);

  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverList(
        delegate:
            SliverChildBuilderDelegate((context, index) => _ListItemWidget(state.floorGoodsList[index]), childCount: state.floorGoodsList.length)));
  }
}

/// SliverList的item
class _ListItemWidget extends StatelessWidget {
  final FloorGoodsList floorGoodsList;

  const _ListItemWidget(this.floorGoodsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleBgColor = Theme.of(context).dividerColor.withOpacity(0.05);
    return Column(
      children: [
        //标题
        Container(
          color: titleBgColor,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(floorGoodsList.name ?? '', style: TextStyle().copyWith(fontSize: 17)),
        ),
        //内容
        Container(
          color: titleBgColor,
          child: GridView.builder(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8, mainAxisSpacing: 5, crossAxisSpacing: 5),
            itemBuilder: (content, index) => _GridViewItem(floorGoodsList.goodsList![index]),
            itemCount: floorGoodsList.goodsList?.length,
          ),
        ),
        Divider(thickness: 5, height: 5, color: titleBgColor),
        //尾部标题
        InkWell(
          onTap: () => ToastUtils.show("点击了${floorGoodsList.name}"),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: Text('moreGoods'.trArgs([floorGoodsList.name ?? '']), style: TextStyle().copyWith(fontSize: 17)),
          ),
        ),
      ],
    );
  }
}

///SliverGrid的item
class _GridViewItem extends StatelessWidget {
  final GoodsList goodsList;

  const _GridViewItem(this.goodsList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(//解决InkWell嵌套 Container设置颜色后 InkWell点击水波纹没了
        color: Theme.of(context).scaffoldBackgroundColor,
        child: InkWell(
          child: Column(
            children: [
              CachedNetworkImage(imageUrl: goodsList.picUrl ?? ''),
              Text(goodsList.name ?? '', style: Theme.of(context).textTheme.subtitle2, softWrap: true, overflow: TextOverflow.ellipsis),
              SizedBox(height: 5),
              Text("¥ ${Decimal.parse(goodsList.retailPrice.toString())}", style: TextStyle(fontSize: 15, color: ColorStyle.color_orange_700)),
            ],
          ),
          onTap: () => {ToastUtils.show("点击了${goodsList.name}")},
        ));
  }
}
