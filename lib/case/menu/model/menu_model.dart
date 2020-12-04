import 'package:flutter/material.dart';

///菜单项实体
/// dingwen
/// 2020/12/3
class MenuModel {
  ///菜单显示的文本
  String text;

  ///菜单显示的图标，针对菜单为1类型，0类型有默认图标
  IconData iconData;

  ///图标大小
  double iconsSize;

  ///样式
  TextStyle textStyle;

  ///菜单类型; 0: 下拉类型 1: 底部弹出表单类型
  int menuType;

  ///是否使用默认的样式
  bool defaultFlag;

  MenuModel(
      {this.text,
      this.iconData,
      this.iconsSize,
      this.textStyle,
      this.menuType = 0,
      this.defaultFlag = true})
      : assert(text != null),
        assert(menuType != null);
}
