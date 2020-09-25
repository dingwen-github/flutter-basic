import 'dart:async';

///单项订阅流

void main() {
  ///初始化单订阅流的控制器
  final StreamController streamController = StreamController();

  ///监听流
  final StreamSubscription streamSubscription =
      streamController.stream.listen((data) => print(data));
  ///流入数据
  streamController.sink.add(100);
  streamController.sink.add({'name':'dingwen'});
  ///关闭流
  streamController.close();
}
