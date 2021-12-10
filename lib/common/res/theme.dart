import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_mall/common/helper/theme_helper.dart';
import 'package:my_flutter_mall/common/service/services.dart';
import 'package:my_flutter_mall/common/service/storage.dart';
import 'package:my_flutter_mall/common/values/storage_name.dart';

import '../../global.dart';

/// @class: AppTheme
/// @author: hp
/// @updateTime: 2021/12/1 11:32
/// @description: 主题配置
/// brightness - Brightness类型，应用程序的整体主题亮度。用于按钮等小部件，以确定在不使用主色（primaryColor）或强调色（accentColor）时选择什么颜色。
/// 当亮度较暗时，画布、卡片和原色都较暗。当亮度为光时，画布和卡片的颜色是明亮的，原色的暗度根据原色亮度变化。当亮度较暗时，原色（primaryColor）与卡片和画布颜色的对比度较差;当亮度较暗时，用白色或亮蓝色来对比。
/*ThemeData({
Brightness brightness, // 应用程序整体主题的亮度。 由按钮等 Widget 使用，以确定在不使用主色或强调色时要选择的颜色
MaterialColor primarySwatch, // 主题颜色样本
Color primaryColor,  // 前景色（文本、按钮等）
Brightness primaryColorBrightness, // primaryColor 的亮度
Color primaryColorLight, // primaryColor 的较亮版本
Color primaryColorDark, // primaryColor 的较暗版本
Color accentColor, // 前景色（文本、按钮等）
Brightness accentColorBrightness, // accentColor的亮度。 用于确定放置在突出颜色顶部的文本和图标的颜色（例如FloatingButton上的图标）
Color canvasColor, // MaterialType.canvas Material 的默认颜色
Color scaffoldBackgroundColor, // 作为Scaffold基础的Material默认颜色，典型Material应用或应用内页面的背景颜色。
Color bottomAppBarColor, // BottomAppBar 的默认颜色
Color cardColor, // Material被用作Card时的颜色
Color dividerColor, // Dividers 和 PopupMenuDividers的颜色，也用于ListTiles中间，和DataTables 的每行中间
Color focusColor, // 焦点获取时的颜色，例如，一些按钮焦点、输入框焦点。
Color hoverColor, // 点击之后徘徊中的颜色，例如，按钮长按，按住之后的颜色
Color highlightColor, // 用于类似墨水喷溅动画或指示菜单被选中的高亮颜色。
Color splashColor, // 墨水喷溅的颜色。
InteractiveInkFeatureFactory splashFactory, // 定义InkWall和InkResponse生成的墨水喷溅的外观。
Color selectedRowColor, // 选中行时的高亮颜色
Color unselectedWidgetColor, // 用于 Widget 处于非活动（但已启用）状态的颜色。 例如，未选中的复选框。 通常与 accentColor 形成对比。
Color disabledColor, // 用于 Widget 无效的颜色，无论任何状态。例如禁用复选框
Color buttonColor, // Material 中 RaisedButtons 使用的默认填充色
ButtonThemeData buttonTheme, // 定义了按钮等控件的默认配置
ToggleButtonsThemeData toggleButtonsTheme, // Flutter 1.9 全新组件 ToggleButtons 的主题
Color secondaryHeaderColor, // 有选定行时 PaginatedDataTable 标题的颜色
Color textSelectionColor, // 文本字段中选中文本的颜色，例如 TextField
Color cursorColor, // 输入框光标颜色
Color textSelectionHandleColor, // 用于调整当前文本的哪个部分的句柄颜色
Color backgroundColor, // 与 primaryColor 对比的颜色(例如 用作进度条的剩余部分)
Color dialogBackgroundColor, // Dialog 元素的背景色
Color indicatorColor, // TabBar 中选项选中的指示器颜色。
Color hintColor, // 用于提示文本或占位符文本的颜色，例如在 TextField 中。
Color errorColor, // 用于输入验证错误的颜色，例如在 TextField 中
Color toggleableActiveColor, // 用于突出显示切换Widget（如Switch，Radio和Checkbox）的活动状态的颜色。
String fontFamily, // 字体样式
TextTheme textTheme, // 与卡片和画布对比的文本颜色
TextTheme primaryTextTheme, // 一个与主色对比的文本主题
TextTheme accentTextTheme, // 与突出颜色对照的文本主题
InputDecorationTheme inputDecorationTheme, // InputDecorator，TextField 和 TextFormField 的默认 InputDecoration 值基于此主题
IconThemeData iconTheme, // 与卡片和画布颜色形成对比的图标主题
IconThemeData primaryIconTheme, // 一个与主色对比的图片主题
IconThemeData accentIconTheme, // 与突出颜色对照的图片主题
SliderThemeData sliderTheme, // 用于渲染 Slider 的颜色和形状
TabBarTheme tabBarTheme, // TabBar 的主题样式
TooltipThemeData tooltipTheme, // tooltip 提示的主题样式
CardTheme cardTheme, // 卡片的主题样式
ChipThemeData chipTheme, // 用于渲染Chip的颜色和样式
TargetPlatform platform, // Widget 需要适配的目标类型
MaterialTapTargetSize materialTapTargetSize, // Chip 等组件的尺寸主题设置
bool applyElevationOverlayColor, // 是否应用 elevation 覆盖颜色
PageTransitionsTheme pageTransitionsTheme, // 页面转场主题样式
AppBarTheme appBarTheme, // AppBar 主题样式
BottomAppBarTheme bottomAppBarTheme, // 底部导航主题样式
ColorScheme colorScheme, // scheme组颜色，一组13种颜色，可用于配置大多数组件的颜色属性
DialogTheme dialogTheme, // 对话框主题样式
FloatingActionButtonThemeData floatingActionButtonTheme, // FloatingActionButton 的主题样式，也就是 Scaffold 属性的那个
Typography typography, // 用于配置 TextTheme、primaryTextTheme 和 accentTextTheme的颜色和几何文本主题值
CupertinoThemeData cupertinoOverrideTheme, // cupertino 覆盖的主题样式
SnackBarThemeData snackBarTheme, // 弹出的 snackBar 的主题样式
BottomSheetThemeData bottomSheetTheme, // 底部滑出对话框的主题样式
PopupMenuThemeData popupMenuTheme, // 弹出菜单对话框的主题样式
MaterialBannerThemeData bannerTheme, // Material 材质的 Banner 主题样式
DividerThemeData dividerTheme, // Divider 组件的主题样式，也就是那个横向线条组件
ButtonBarThemeData buttonBarTheme,
})*/

class AppTheme {
  static AppTheme get to => Get.find();

  List<String> fontValueList = ['system', 'kuaile'];

  /// 用户选择的明暗模式
  late bool _userDarkMode;

  /// 当前主题颜色
  late MaterialColor _themeColor;

  /// 当前字体索引
  late int _fontIndex;

  int get fontIndex => _fontIndex;

  AppTheme() {
    /// 用户选择的明暗模式
    _userDarkMode = StorageService.to.getBool(ThemeUserDarkMode) ?? false;

    /// 获取主题色
    _themeColor =
        Colors.primaries[StorageService.to.getInt(ThemeColorIndex) ?? 5];

    /// 获取字体
    _fontIndex = StorageService.to.getInt(FontIndex) ?? 0;
  }

  /// 切换指定色彩
  ///
  /// 没有传[brightness]就不改变brightness,color同理
  void switchTheme({bool? userDarkMode, MaterialColor? color}) {
    _userDarkMode = userDarkMode ?? _userDarkMode;
    _themeColor = color ?? _themeColor;

    Get.changeTheme(themeData());
    //设置系统状态栏
    Global.setSystemUi(_userDarkMode);

    saveTheme2Storage(_userDarkMode, _themeColor);
  }

  /// 随机一个主题色彩
  ///
  /// 可以指定明暗模式,不指定则保持不变
  void switchRandomTheme() {
    int colorIndex = Random().nextInt(Colors.primaries.length - 1);
    switchTheme(
      userDarkMode: Random().nextBool(),
      color: Colors.primaries[colorIndex],
    );
  }

  /// 切换字体
  switchFont(int index) {
    _fontIndex = index;
    switchTheme();
    saveFontIndex(index);
  }

  /// 根据主题 明暗 和 颜色 生成对应的主题
  /// [dark]系统的Dark Mode
  themeData({bool platformDarkMode: false}) {
    var isDark = platformDarkMode || _userDarkMode;
    Brightness brightness = isDark ? Brightness.dark : Brightness.light;

    var themeColor = _themeColor;
    var accentColor = isDark ? themeColor[700] : _themeColor;
    var themeData = ThemeData(
        brightness: brightness,
        // 主题颜色属于亮色系还是属于暗色系(eg:dark时,AppBarTitle文字及状态栏文字的颜色为白色,反之为黑色)
        // 这里设置为dark目的是,不管App是明or暗,都将appBar的字体颜色的默认值设为白色.
        // 再AnnotatedRegion<SystemUiOverlayStyle>的方式,调整响应的状态栏颜色
        primaryColorBrightness: Brightness.dark,
        accentColorBrightness: Brightness.dark,
        primarySwatch: themeColor,
        accentColor: accentColor,
        fontFamily: fontValueList[_fontIndex]);

    themeData = themeData.copyWith(
      brightness: brightness,
      accentColor: accentColor,
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: themeColor,
        brightness: brightness,
      ),

      appBarTheme: themeData.appBarTheme.copyWith(elevation: 0),
      splashColor: themeColor.withAlpha(50),
      hintColor: themeData.hintColor.withAlpha(90),
      errorColor: Colors.red,
      cursorColor: accentColor,
      // textTheme: themeData.textTheme.copyWith(
      //     /// 解决中文hint不居中的问题 https://github.com/flutter/flutter/issues/40248
      //     subhead: themeData.textTheme.subhead
      //         .copyWith(textBaseline: TextBaseline.alphabetic)),
      textSelectionColor: accentColor?.withAlpha(60),
      textSelectionHandleColor: accentColor?.withAlpha(60),
      toggleableActiveColor: accentColor,
      chipTheme: themeData.chipTheme.copyWith(
        pressElevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 10),
        labelStyle: themeData.textTheme.caption,
        backgroundColor: themeData.chipTheme.backgroundColor.withOpacity(0.1),
      ),
//          textTheme: CupertinoTextThemeData(brightness: Brightness.light)
      inputDecorationTheme: ThemeHelper.inputDecorationTheme(themeData),
    );
    return themeData;
  }

  /// 数据持久化到shared preferences
  saveTheme2Storage(bool userDarkMode, MaterialColor themeColor) {
    var index = Colors.primaries.indexOf(themeColor);
    StorageService.to.setBool(ThemeUserDarkMode, userDarkMode);
    StorageService.to.setInt(ThemeColorIndex, index);
  }

  /// 根据索引获取字体名称,这里牵涉到国际化
  String fontName(index) {
    switch (index) {
      case 0:
        return 'autoBySystem'.tr;
      case 1:
        return 'fontKuaiLe'.tr;
      default:
        return '';
    }
  }

  /// 字体选择持久化
  saveFontIndex(int index) {
    StorageService.to.setInt(FontIndex, index);
  }
}
