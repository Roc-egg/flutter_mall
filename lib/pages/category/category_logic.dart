import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/network/dio_config/http/request_repository.dart';

import 'category_state.dart';

class CategoryLogic extends GetxController {
  final CategoryState state = CategoryState();

  ///获取分类数据
  void getCategoryData() {
    RequestRepository.to.getCategoryData(state.id, (data) {
      state.currentCategory = data.currentCategory;
      if (data.categoryList != null && data.categoryList!.isNotEmpty) state.categoryList.value = data.categoryList!;
      state.currentSubCategory.value = data.currentSubCategory ?? [];
    }, (code, msg) {
      debugPrint("错误=》 code==${code}，msg==${msg}");
    });
  }

  @override
  void onReady() {
    super.onReady();

    ///获取分类数据
    getCategoryData();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
