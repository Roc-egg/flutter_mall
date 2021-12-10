import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/utils/toast_util.dart';
import 'package:my_flutter_mall/model/home_mode.dart';

import '../home_logic.dart';
import 'coupon_shape_border.dart';

/// @class: CouponWidget
/// @author: hp
/// @updateTime: 2021/12/7 19:59
/// @description: 优惠券专区视图
class CouponWidget extends StatelessWidget {
  CouponWidget({Key? key}) : super(key: key);

  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return _channelItemWidget(state.couponList[index]);
        }, childCount: state.couponList.length)));
  }
}

class _channelItemWidget extends StatelessWidget {
  final logic = Get.find<HomeLogic>();
  final CouponList couponList;

  _channelItemWidget(this.couponList);

  @override
  Widget build(BuildContext context) {
    var white = Colors.white;
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: () => {ToastUtils.show("点击了${couponList.discount}")},
        child: Material(
          color: Colors.orange.withOpacity(0.8),
          elevation: 0,
          shape: CouponShapeBorder(color: Theme.of(context).scaffoldBackgroundColor),
          child: Container(
            alignment: Alignment.center,
            height: 120,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  //设置权重对应CouponShapeBorder中的虚线位置比例
                  flex: 7,
                  //设置占满权重的全部空间
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          visible: couponList.tag?.isNotEmpty ?? false,
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Container(
                                color: Colors.orange.withOpacity(0.7),
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.all(3),
                                child:
                                    Text(couponList.tag ?? "", style: TextStyle(fontSize: 10, color: white))),
                          )),
                      RichText(
                        text: TextSpan(style: DefaultTextStyle.of(context).style, children: [
                          TextSpan(
                              text: "¥", style: TextStyle(fontSize: 15, color: Colors.red.withOpacity(0.9))),
                          TextSpan(
                              text: Decimal.parse(couponList.discount.toString()).toString(),
                              style: TextStyle(fontSize: 45, color: Colors.red.withOpacity(0.9))),
                          TextSpan(text: couponList.desc, style: TextStyle(fontSize: 23, color: white)),
                        ]),
                      ),
                      Text('fullMinus'.trArgs([Decimal.parse(couponList.min.toString()).toString()]),
                          style: TextStyle(fontSize: 12, color: white)),
                    ],
                  ),
                ),
                //优惠券左边视图
                Flexible(
                  //设置权重对应CouponShapeBorder中的虚线位置比例
                  flex: 3,
                  //设置占满权重的全部空间
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(couponList.name ?? "", style: TextStyle(color: white)),
                      Text('validity'.trArgs([couponList.days == 0 ? " -" : "${couponList.days}${'day'.tr}"]),
                          style: TextStyle(fontSize: 12, color: white)),
                      SizedBox(height: 5),
                      OutlinedButton(
                        child: Text('getItNow'.tr, style: TextStyle(color: white)),
                        onPressed: () => {ToastUtils.show("点击了${couponList.discount}")},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
