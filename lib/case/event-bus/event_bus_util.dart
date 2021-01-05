import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter_basic/case/event-bus/event.dart';

/// 事件总线工具类
/// @author: dingwen
/// @date: 2020/12/24

class EventBusUtil {
  static EventBus _eventBus;

  ///获取[EventBus]单例
  static EventBus getInstance() {
    if (_eventBus == null) {
      return EventBus();
    }
    return _eventBus;
  }

  ///监听事件
  ///返回某个事件的订阅者
  static StreamSubscription<T> listen<T extends Event>(Function(T event) onData){
    if(_eventBus == null){
      _eventBus = EventBus();
    }
    return _eventBus.on<T>().listen(onData);
  }


  ///发送事件
  static void fire<T extends Event>(T e){
    if(_eventBus == null){
      _eventBus = EventBus();
    }
    return _eventBus.fire(e);
  }
}
