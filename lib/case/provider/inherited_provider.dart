import 'package:flutter/cupertino.dart';

/// 保存需要共享的数据
/// @author: dingwen
/// @date: 2020/12/24

class InheritedProvider<T> extends InheritedWidget {

  ///需要共享的状态
  final T data;

  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  ///数据发生改变的时候是否需要更新
  @override
  bool updateShouldNotify(InheritedProvider<T> oldWidget) {
    //每次更新都会调用依赖次InheritedWidget中的数据的子widget中，state.didChangeDependencies方法
    return true;
  }
}
