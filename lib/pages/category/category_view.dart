import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/widgets/app.dart';
import 'package:my_flutter_mall/pages/category/view/left_widget.dart';

import 'category_logic.dart';
import 'view/right_widget.dart';

/// @class: CategoryPage
/// @author: hp
/// @updateTime: 2021/12/13 15:09
/// @description: 分类视图
class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with AutomaticKeepAliveClientMixin {
  final logic = Get.find<CategoryLogic>();
  final state = Get.find<CategoryLogic>().state;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: MyAppBar(title: Text('homeCategory'.tr), actions: <Widget>[
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ))
      ]),
      body: Row(
        children: [
          Flexible(
            //设置权重对应CouponShapeBorder中的虚线位置比例
            flex: 2,
            //设置占满权重的全部空间
            fit: FlexFit.tight,
            child: LeftWidget(),
          ),
          Flexible(
              //设置权重对应CouponShapeBorder中的虚线位置比例
              flex: 8,
              //设置占满权重的全部空间
              fit: FlexFit.tight,
              child: RightWidget()),
        ],
      ),
    );
  }
}
