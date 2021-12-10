import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/pages/my/view/UserHeaderWidget.dart';
import 'package:my_flutter_mall/pages/my/view/user_list_widget.dart';

import 'my_logic.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin {
  final logic = Get.find<MyLogic>();
  final state = Get.find<MyLogic>().state;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // actions: [],
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: 200 + MediaQuery.of(context).padding.top,
            flexibleSpace: UserHeaderWidget(),
            pinned: false,
          ),
          UserListWidget(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MyLogic>();
    super.dispose();
  }
}
