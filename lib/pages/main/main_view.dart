import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/widgets/app.dart';
import 'package:my_flutter_mall/pages/classification/classification_view.dart';
import 'package:my_flutter_mall/pages/home/home_view.dart';
import 'package:my_flutter_mall/pages/my/my_view.dart';
import 'package:my_flutter_mall/pages/shopping_cart/shopping_cart_view.dart';

import '../../global.dart';

import 'main_logic.dart';
import 'main_state.dart';

/// @class: MainPage
/// @author: hp
/// @updateTime: 2021/12/3 10:39
/// @description: main主页
class MainPage extends StatelessWidget with WidgetsBindingObserver {
  const MainPage({Key? key}) : super(key: key);

  ///监听应用从后台切换到前台时，读取粘贴板中的数据，验证URL，已保存分享
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      var clipboardData = Clipboard.getData(Clipboard.kTextPlain);
      clipboardData.then((value) {
        debugPrint("clipboardData=> ${value?.text}");
        if (value != null &&
            value.text != null &&
            value.text!.isNotEmpty &&
            (value.text!.startsWith("https://") || value.text!.startsWith("http://"))) {
          // Get.dialog(ShareArticleDialog(url: value.text!));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    final logic = Get.find<MainLogic>();
    final state = Get.find<MainLogic>().state;
    WidgetsBinding.instance?.addObserver(this);

    return Scaffold(
      // appBar: _buildAppBar(logic, state),
      body: _buildPageView(logic, state),
      bottomNavigationBar: _buildBottomNavigationBar(logic, state),
    );
  }

  ///顶部导航栏
  AppBar _buildAppBar(MainLogic logic, MainState state) {
    return transparentAppBar(
        title: Obx(() => Text(
              logic.tabTitles[state.page],
            )),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ))
        ]);
  }

  /// 内容页
  Widget _buildPageView(MainLogic logic, MainState state) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomePage(),
        ClassificationPage(),
        ShoppingCartPage(),
        MyPage(),
      ],
      controller: logic.pageController,
      onPageChanged: logic.handlePageChanged,
    );
  }

  /// 底部导航
  Widget _buildBottomNavigationBar(MainLogic logic, MainState state) {
    return Obx(() => BottomNavigationBar(
          items: logic.bottomTabs,
          currentIndex: state.page,
          type: BottomNavigationBarType.fixed,
          onTap: logic.handleNavBarTap,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
        ));
  }
}
