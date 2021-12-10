import 'package:cached_network_image/cached_network_image.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/utils/toast_util.dart';
import 'package:my_flutter_mall/model/home_mode.dart';

import '../home_logic.dart';

/// @class: TopicWidget
/// @author: hp
/// @updateTime: 2021/12/9 18:20
/// @description: 专题精选专区视图
class TopicWidget extends StatelessWidget {
  TopicWidget({Key? key}) : super(key: key);

  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverToBoxAdapter(
          child: Container(
            height: Get.width * 0.7,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.topicList.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  ToastUtils.show("点击了${state.topicList[index].title}");
                },
                child: _TopicItemWidget(state.topicList[index]),
              ),
              padding: EdgeInsets.only(left: 8, right: 8),
              separatorBuilder: (BuildContext context, int index) => Container(width: 8, color: Colors.transparent),
            ),
          ),
        ));
  }
}

class _TopicItemWidget extends StatelessWidget {
  final TopicList topicList;

  const _TopicItemWidget(this.topicList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: topicList.picUrl ?? '',
            width: Get.width * 0.9,
            height: Get.width * 0.52,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                  child: Text(topicList.title ?? "", style: Theme.of(context).textTheme.subtitle2, softWrap: false, overflow: TextOverflow.ellipsis)),
              SizedBox(width: 5),
              Text("¥${'yuanQi'.trArgs([Decimal.parse(topicList.price.toString()).toString()])}",
                  style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.orange[700]))
            ],
          ),
          SizedBox(height: 5),
          Text(
            topicList.subtitle ?? "",
            style: Theme.of(context).textTheme.caption,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
