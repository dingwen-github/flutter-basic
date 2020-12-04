/// 下拉菜单子菜单数据实体
/// dingwen
/// 2020/12/3

class ConditionModel {
  /// 对应菜单的字典翻译值,需要传递到后端的值
  String name;

  /// 子菜单显示值
  String value;

  /// 菜单是否被选中,true被选中，false未被选中
  bool isSelected;

  ConditionModel({this.name, this.value, this.isSelected = false})
      : assert(name != null),
        assert(value != null),
        assert(isSelected != null && (isSelected is bool));
}
