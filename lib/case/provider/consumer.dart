import 'package:flutter/cupertino.dart';
import 'package:flutter_basic/case/provider/change_notifier_provider.dart';

/// 状态的消费者
/// @author: dingwen
/// @date: 2020/12/25

class Consumer<T> extends StatefulWidget {
  ///用户构建的child
  final Widget child;

  ///用户出入一个函数执行返回[context][model]的函数
  ///再由用户构建child
  final Widget Function(BuildContext context, T value) builder;

  const Consumer({Key key, this.builder,this.child,}) : super(key: key);

  @override
  _ConsumerState<T> createState() => _ConsumerState<T>();
}

class _ConsumerState<T> extends State<Consumer<T>> {

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, ChangeNotifierProvider.of<T>(context));
  }

}
