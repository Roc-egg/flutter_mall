import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:my_flutter_mall/model/home_mode.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeState {
  ///顶部高度
  double height = 200;

  ///控制顶部bar显示
  final _showTopBtn = false.obs;

  get showTopBtn => _showTopBtn.value;

  set showTopBtn(val) => _showTopBtn.value = val;

  ///刷新的控制器
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  RefreshController get refreshController => _refreshController;

  ///CustomScrollView滑动的控制器
  ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  set scrollController(value) => _scrollController = value;

  ///首页banner数据
  final RxList<HomeBanner> _homeBannerData = <HomeBanner>[].obs;

  RxList<HomeBanner> get homeBannerData => _homeBannerData;

  set homeBannerData(RxList<HomeBanner> value) => _homeBannerData.value = value;

  ///首页分类GridView列表数据
  final RxList<Channel> _channelData = <Channel>[].obs;

  RxList<Channel> get channelData => _channelData;

  set channelData(RxList<Channel> value) => _channelData.value = value;

  ///首页优惠券数据
  final RxList<CouponList> _couponList = <CouponList>[].obs;

  RxList<CouponList> get couponList => _couponList;

  set couponList(RxList<CouponList> value) => _couponList.value = value;

  ///团购专区数据
  final RxList<GrouponList> _grouponList = <GrouponList>[].obs;

  RxList<GrouponList> get grouponList => _grouponList;

  set grouponList(RxList<GrouponList> value) => _grouponList.value = value;

  ///品牌制造商直供数据
  final RxList<BrandList> _brandList = <BrandList>[].obs;

  RxList<BrandList> get brandList => _brandList;

  set brandList(RxList<BrandList> value) => _brandList.value = value;

  ///新品首发数据
  final RxList<NewGoodsList> _newGoodsList = <NewGoodsList>[].obs;

  RxList<NewGoodsList> get newGoodsList => _newGoodsList;

  set newGoodsList(RxList<NewGoodsList> value) => _newGoodsList.value = value;

  ///人气推荐数据
  final RxList<HotGoodsList> _hotGoodsList = <HotGoodsList>[].obs;

  RxList<HotGoodsList> get hotGoodsList => _hotGoodsList;

  set hotGoodsList(RxList<HotGoodsList> value) => _hotGoodsList.value = value;

  ///专题精选数据
  final RxList<TopicList> _topicList = <TopicList>[].obs;

  RxList<TopicList> get topicList => _topicList;

  set topicList(RxList<TopicList> value) => _topicList.value = value;

  ///底部货物清单分类
  final RxList<FloorGoodsList> _floorGoodsList = <FloorGoodsList>[].obs;

  RxList<FloorGoodsList> get floorGoodsList => _floorGoodsList;

  set floorGoodsList(RxList<FloorGoodsList> value) => _floorGoodsList.value = value;
}
