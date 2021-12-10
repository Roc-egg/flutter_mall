import 'package:get/get.dart';
import 'package:my_flutter_mall/common/network/dio_config/http/request.dart';
import 'package:my_flutter_mall/common/network/dio_config/http/request_api.dart';
import 'package:my_flutter_mall/model/home_mode.dart';

import 'http_request.dart';

/// @class: RequestRepository
/// @author: hp
/// @updateTime: 2021/12/3 17:15
/// @description: 网络请求仓库
class RequestRepository {
  ///获取网络请求仓库实例
  static RequestRepository get to => Get.find();

  ///获取主页数据
  ///[success] 请求成功回调
  ///[fail] 请求失败回调
  getHomeData(
    Success<HomeData>? success,
    Fail? fail,
  ) {
    Request.get(RequestApi.home_index, {}, dialog: false, success: (data) {
      if (success != null) {
        var homeData = HomeData.fromJson(data);
        success(homeData);
      }
    }, fail: (code, msg) {
      if (fail != null) {
        fail(code, msg);
      }
    });
  }
}
