import 'dart:async';

///广播流
void main() {
  /// 初始化广播流控制器
  final StreamController<int> streamController = StreamController<int>.broadcast();

  ///设置监听器，并通过StreamTransformer来过滤数据
  final StreamSubscription streamSubscription = streamController.stream
      .where((value) => (value.isEven))
      .listen((data) => print(data));

  ///向流中添加数据
  for (int i = 0; i < 100; i++) {
    streamController.sink.add(i);
  }

  ///关闭流控制器
  streamController.close();
}
