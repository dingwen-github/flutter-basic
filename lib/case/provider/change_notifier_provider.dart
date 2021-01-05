import 'package:flutter/material.dart';
import 'package:flutter_basic/case/provider/inherited_provider.dart';
import 'package:flutter_basic/case/provider/my_change_notifier.dart';

/// 订阅者类
/// @author: dingwen
/// @date: 2020/12/24

class ChangeNotifierProvider<T extends MyChangeNotifier>
    extends StatefulWidget {
  final Widget child;
  final T data;

  const ChangeNotifierProvider({Key key, this.data, this.child});

  ///获取InheritedProvider中的共享数据

  static T of<T>(BuildContext context, {bool listen = true}) => listen
      ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>().data
      : (context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
              ?.widget as InheritedProvider<T>).data;

  @override
  _ChangeNotifierProviderState<T> createState() =>
      _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends MyChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {
  ///添加[update]监听
  ///如果[model]类调用了[notifyListeners]，表示数据发生了变化，此时需要重新构建[InheritedProvider]
  void update() => setState(() => {});

  ///初始化添加监听器
  @override
  void initState() {
    super.initState();
    widget.data.addListener(update);
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }

  ///当Provider更新的时候，新旧数据不一致
  ///需要解除旧数据监听，添加新数据监听
  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }


  ///销毁时移除监听器
  @override
  void dispose() {
    super.dispose();
    widget.data.removeListener(update);
  }


}
