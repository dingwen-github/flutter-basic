
import 'package:flutter_basic/case/event-bus/event.dart';

/// 子[widget]或者弹出确定事件
/// @author: dingwen
/// @date: 2020/12/24

class ConfirmEvent extends Event{
  final String status;

  ConfirmEvent({this.status});
}