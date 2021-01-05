import 'package:flutter/cupertino.dart';

/// 存放需要分享数据的 Widget
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget(Widget child, {@required this.data}) : super(child: child);

  ///需要在子树中共享的数据
  final int data;

  ///在子[widget]中获取数据的方法

  static ShareDataWidget of(BuildContext context) =>
      //注册了关系，会更新
  context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  //没有注册关系，不会更新
  // context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;


  ///当data发生改变的时候是否通知子树中依赖data的 Widget
  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    //返回true : 所依赖的子widget state.didChangeDependencies调用
    return oldWidget.data != data;
  }
}
