/// @class: RequestApi
/// @author: hp
/// @updateTime: 2021/12/3 17:15
/// @description: 网络请求接口
class RequestApi {
  /// 请求主地址
  static const String baseurl = 'http://119.91.147.135:8087/wx/';

  /// 主页数据
  static const String home_index = 'home/index';

  /// 获取分类数据
  /// 加index首次进入获取一级分类的数据
  /// 加current?id=分类id  获取指定一级分类下二级分类的数据
  static const String catalog_index = 'catalog/';
}
