import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();
  /// tab页标题
  late final List<String> tabTitles;

  /// 页控制器
  late final PageController pageController;

  /// 底部导航项目
  late final List<BottomNavigationBarItem> bottomTabs;

  ///tab栏的动画
  void handleNavBarTap(int page) {
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }

  ///tab栏页面切换
  void handlePageChanged(int page) {
    state.page = page;
  }

  @override
  void onInit() {
    super.onInit();

    ///初始化数据
    tabTitles = [
      'homeHome'.tr,
      'homeCategory'.tr,
      'homeShoppingCart'.tr,
      'homeMy'.tr
    ];

    bottomTabs = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: tabTitles[0],
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: tabTitles[1],
        icon: Icon(Icons.dashboard),
      ),
      BottomNavigationBarItem(
        label: tabTitles[2],
        icon: Icon(Icons.shopping_cart),
      ),
      BottomNavigationBarItem(
        label: tabTitles[3],
        icon: Icon(Icons.person),
      ),
    ];

    pageController = PageController(initialPage: state.page);
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
