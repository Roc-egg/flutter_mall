import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MainState {
  ///当前 tab 索引
  final _page = 0.obs;

  get page => _page.value;

  set page(val) => _page.value = val;
}
