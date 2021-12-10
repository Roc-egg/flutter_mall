import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/network/dio_config/http/request_repository.dart';
import 'package:my_flutter_mall/model/home_mode.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  ///获取首页数据
  void getHomeData() {
    RequestRepository.to.getHomeData((data) {
      //添加banner数据
      state.homeBannerData.value = data.banner!;
      //添加首页Channel分类数据
      state.channelData.value = data.channel!;
      //添加首页优惠券数据
      state.couponList.value = data.couponList!;
      //添加首页团购专区数据
      state.grouponList.value = data.grouponList!;
      //添加首页品牌制造商直供数据
      state.brandList.value = data.brandList!;
      //添加首页新品首发数据
      state.newGoodsList.value = data.newGoodsList!;
      //添加首页人气推荐数据
      state.hotGoodsList.value = data.hotGoodsList!;
      //添加首页专题精选数据
      state.topicList.value = data.topicList!;
      //添加首页底部货物清单分类
      state.floorGoodsList.value = data.floorGoodsList!;

      //刷新成功
      state.refreshController.refreshCompleted();
    }, (code, msg) {
      debugPrint("错误=》 code==${code}，msg==${msg}");
      state.refreshController.refreshFailed();
    });
  }

  initScrollController() {
    state.scrollController.addListener(() {
      if (state.scrollController.offset > state.height && !state.showTopBtn) {
        state.showTopBtn = true;
      } else if (state.scrollController.offset < state.height && state.showTopBtn) {
        state.showTopBtn = false;
      }
    });
  }

  scrollToTop() {
    state.scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeOutCubic);
  }

  @override
  void onReady() {
    super.onReady();
    initScrollController();
    getHomeData();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
