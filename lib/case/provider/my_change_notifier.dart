import 'package:flutter/cupertino.dart';

/// 用来当状态发生改变的时候通知更新的类
/// @author: dingwen
/// @date: 2020/12/24

class MyChangeNotifier implements Listenable {
  List listeners = [];

  ///添加监听器
  @override
  void addListener(listener) {
    listeners.add(listener);
  }

  ///删除监听器
  @override
  void removeListener(listener) {
    listeners?.remove(listener);
  }

  ///通知所有监听器触发回调

  void notifyListeners() {
    listeners?.forEach((listener) => listener());
  }
}
