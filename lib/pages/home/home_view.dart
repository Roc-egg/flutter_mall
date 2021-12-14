import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/widgets/animated_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'home_logic.dart';
import 'home_view/brand_widget.dart';
import 'home_view/coupon_widget.dart';
import 'home_view/banner_widget.dart';
import 'home_view/channel_widget.dart';
import 'home_view/floor_goods_widget.dart';
import 'home_view/groupon_widget.dart';
import 'home_view/hot_goods_widget.dart';
import 'home_view/new_goods_widget.dart';
import 'home_view/sliver_title_divider.dart';
import 'home_view/topic_widget.dart';

/// @class: HomePage
/// @author: hp
/// @updateTime: 2021/12/13 15:09
/// @description: 首页视图
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //计算banner高度
    var bannerHeight = MediaQuery.of(context).size.width * 5 / 11;
    //初始scrollController
    state.height = bannerHeight - kToolbarHeight;
    return Obx(() => Scaffold(
          body: MediaQuery.removePadding(
              context: context,
              removeTop: false,
              child: Builder(builder: (_) {
                return RefreshConfiguration.copyAncestor(
                    context: context,
                    child: SmartRefresher(
                      controller: state.refreshController,
                      //下拉刷新
                      onRefresh: () {
                        logic.getHomeData();
                      },
                      //上拉加载更多
                      onLoading: () {
                        /// TODO
                      },
                      child: CustomScrollView(
                        controller: state.scrollController,
                        slivers: [
                          SliverAppBar(
                            actions: <Widget>[
                              EmptyAnimatedSwitcher(
                                display: state.showTopBtn,
                                child: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {
                                    // showSearch(
                                    //     context: context,
                                    //     delegate: DefaultSearchDelegate()
                                    // );
                                  },
                                ),
                              ),
                            ],
                            flexibleSpace: FlexibleSpaceBar(
                              background: BannerWidget(),
                              centerTitle: true,
                              title: GestureDetector(
                                onDoubleTap: logic.scrollToTop,
                                child: EmptyAnimatedSwitcher(
                                  display: state.showTopBtn,
                                  child: Text('appName'.tr),
                                ),
                              ),
                            ),
                            expandedHeight: bannerHeight,
                            pinned: true,
                          ),
                          //首页分类视图
                          ChannelWidget(),
                          //优惠券区标题
                          SliverTitleDivider(list: state.couponList, title: 'coupon'.tr, height: 10),
                          //优惠券区
                          CouponWidget(),
                          //团购专区标题
                          SliverTitleDivider(list: state.grouponList, title: 'groupBuyingArea'.tr, height: 10),
                          //团购专区
                          GrouponWidget(),
                          //品牌制造商标题
                          SliverTitleDivider(list: state.brandList, title: 'brandManufacturerDirectSupply'.tr, height: 10),
                          //品牌制造商专区
                          BrandWidget(),
                          //新品首发标题
                          SliverTitleDivider(list: state.newGoodsList, title: 'newProductLaunch'.tr, height: 10),
                          //新品首发专区
                          NewGoodsWidget(),
                          //人气推荐标题
                          SliverTitleDivider(list: state.hotGoodsList, title: 'popularityRecommendation'.tr, height: 10),
                          //人气推荐专区
                          HotGoodsWidget(),
                          //专题精选标题
                          SliverTitleDivider(list: state.topicList, title: 'selectedTopics'.tr, height: 10),
                          //专题精选专区
                          TopicWidget(),
                          //底部商品类分区
                          FloorGoodsWidget(),
                        ],
                      ),
                    ));
              })),
          floatingActionButton: ScaleAnimatedSwitcher(
            child: state.showTopBtn && state.refreshController.headerStatus != RefreshStatus.twoLevelOpening
                ? FloatingActionButton(
                    heroTag: 'homeEmpty',
                    key: ValueKey(Icons.vertical_align_top),
                    onPressed: () {
                      logic.scrollToTop();
                    },
                    child: Icon(
                      Icons.vertical_align_top,
                    ),
                  )
                : FloatingActionButton(
                    heroTag: 'homeFab',
                    key: ValueKey(Icons.search),
                    onPressed: () {
                      // showSearch(context: context, delegate: DefaultSearchDelegate());
                    },
                    child: Icon(
                      Icons.search,
                    ),
                  ),
          ),
        ));
  }

  @override
  void dispose() {
    Get.delete<HomeLogic>();
    super.dispose();
  }
}
