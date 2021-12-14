import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/utils/toast_util.dart';
import 'package:my_flutter_mall/model/home_mode.dart';

import '../home_logic.dart';

/// @class: CategoryWidget
/// @author: hp
/// @updateTime: 2021/12/7 14:15
/// @description: 首页渠道视图
class ChannelWidget extends StatelessWidget {
  ChannelWidget({Key? key}) : super(key: key);

  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, childAspectRatio: 1),
          delegate: SliverChildBuilderDelegate((content, index) {
            return InkWell(
              child: _buildGridViewItem(logic.state.channelData[index]),
              onTap: () => {ToastUtils.show("点击了${logic.state.channelData[index].name}")},
            );
          }, childCount: logic.state.channelData.length),
        ));
  }
}

class _buildGridViewItem extends StatelessWidget {
  final Channel channelData;

  _buildGridViewItem(this.channelData);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 18),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: channelData.iconUrl ?? "",
            width: 20,
            height: 20,
          ),
          SizedBox(height: 5),
          Text(
            channelData.name ?? "",
            style: TextStyle().copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
