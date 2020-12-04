
import 'package:flutter/material.dart';
import 'package:flutter_basic/case/menu/menu.dart';
import 'package:flutter_basic/case/menu/model/condition_model.dart';
import 'package:flutter_basic/case/menu/model/menu_model.dart';
import 'package:flutter_basic/case/tip/data_null_tip.dart';

class MenuTest extends StatefulWidget {
  @override
  _MenuTestState createState() => _MenuTestState();
}

class _MenuTestState extends State<MenuTest> {
  String title = 'Menu Test';
  bool titleIsCenter = true;
  List<MenuModel> menus = [
    MenuModel(text: 'menu1', defaultFlag: true),
    MenuModel(text: 'menu2', defaultFlag: true),
    MenuModel(text: 'menu3', defaultFlag: true),
    MenuModel(text: 'menu4', defaultFlag: true),
    MenuModel(
      text: 'menu5',
      defaultFlag: false,
      menuType: 1,
      iconData: Icons.filter_frames,
    ),
  ];

  List<List<ConditionModel>> childMenuConditions = [
    [
      ConditionModel(name: 'name1', value: 'value1', isSelected: true),
      ConditionModel(name: 'name2', value: 'value2', isSelected: false),
      ConditionModel(name: 'name3', value: 'value3', isSelected: false),
      ConditionModel(name: 'name4', value: 'value4', isSelected: false),
      ConditionModel(name: 'name5', value: 'value5', isSelected: false),
      ConditionModel(name: 'name6', value: 'value6', isSelected: false),
    ],
    [
      ConditionModel(name: 'name7', value: 'value7', isSelected: true),
      ConditionModel(name: 'name8', value: 'value8', isSelected: false),
      ConditionModel(name: 'name9', value: 'value9', isSelected: false),
      ConditionModel(name: 'name10', value: 'value10', isSelected: false),
      ConditionModel(name: 'name11', value: 'value11', isSelected: false),
      ConditionModel(name: 'name12', value: 'value12', isSelected: false),
    ],
    [
      ConditionModel(name: 'name7', value: 'value7', isSelected: true),
      ConditionModel(name: 'name8', value: 'value8', isSelected: false),
      ConditionModel(name: 'name9', value: 'value9', isSelected: false),
      ConditionModel(name: 'name10', value: 'value10', isSelected: false),
      ConditionModel(name: 'name11', value: 'value11', isSelected: false),
      ConditionModel(name: 'name12', value: 'value12', isSelected: false),
    ],
    [
      ConditionModel(name: 'name7', value: 'value7', isSelected: true),
      ConditionModel(name: 'name8', value: 'value8', isSelected: false),
      ConditionModel(name: 'name9', value: 'value9', isSelected: false),
      ConditionModel(name: 'name10', value: 'value10', isSelected: false),
      ConditionModel(name: 'name11', value: 'value11', isSelected: false),
      ConditionModel(name: 'name12', value: 'value12', isSelected: false),
    ]
  ];

  List<ConditionModel> defaultConditions = [
    ConditionModel(name: 'name1', value: 'value1', isSelected: true),
    ConditionModel(name: 'name7', value: 'value7', isSelected: true),
    ConditionModel(name: 'name7', value: 'value7', isSelected: true),
    ConditionModel(name: 'name7', value: 'value7', isSelected: true),
  ];

  List dataList = [
    {'name': 'dingwen'}
  ];

  @override
  Widget build(BuildContext context) {
    return Menu(
      title: title,
      titleIsCenter: titleIsCenter,
      menus: menus,
      childMenuConditions: childMenuConditions,
      defaultConditions: defaultConditions,
      buildTip: buildTip,
    );
  }

  Widget buildTip() {
    return DataNullTip();
  }
}
