import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// @class: HomeRefreshHeader
/// @author: hp
/// @updateTime: 2021/12/6 17:39
/// @description: 首页列表的header
class HomeRefreshHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicHeader(
      releaseText: 'canRefreshText'.tr,
      idleText: 'idleRefreshText'.tr,
      refreshingText: 'refreshingText'.tr,
      completeText: 'refreshCompleteText'.tr,
      failedText: 'refreshFailedText'.tr,
    );
  }
}

/// 通用的footer
///
/// 由于国际化需要context的原因,所以无法在[RefreshConfiguration]配置
class RefresherFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      failedText: 'loadFailedText'.tr,
      idleText: 'idleLoadingText'.tr,
      loadingText: 'loadingText'.tr,
      noDataText: 'noMoreText'.tr,
      canLoadingText: 'canLoadingText'.tr,
    );
  }
}
