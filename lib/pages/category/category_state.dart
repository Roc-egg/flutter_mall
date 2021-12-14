import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:my_flutter_mall/model/category_mode.dart';

class CategoryState {
  ///一级分类的id
  int id = -1;

  ///当前选中的一级分类的数据
  final Rx<CurrentCategory> _currentCategory = CurrentCategory().obs;

  Rx<CurrentCategory> get currentCategory => _currentCategory;

  set currentCategory(value) => _currentCategory.value = value;

  ///一级分类列表数据
  final RxList<CategoryList> _categoryList = <CategoryList>[].obs;

  RxList<CategoryList> get categoryList => _categoryList;

  set categoryList(RxList<CategoryList> value) => _categoryList.value = value;

  ///一级分类下二级分类列表数据
  final RxList<CurrentSubCategory> _currentSubCategory = <CurrentSubCategory>[].obs;

  RxList<CurrentSubCategory> get currentSubCategory => _currentSubCategory;

  set currentSubCategory(RxList<CurrentSubCategory> value) => _currentSubCategory.value = value;

  ///记录当前选中的一级分类索引
  final _selectIndex = 0.obs;

  get selectIndex => _selectIndex.value;

  set selectIndex(val) => _selectIndex.value = val;
}
