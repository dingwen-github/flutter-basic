import 'package:flutter/cupertino.dart';

/// 自定义通知
/// @author: dingwen
/// @date: 2020/12/24

class MyNotification extends Notification {
  final String msg;

  MyNotification({@required this.msg}) : assert(msg != null);
}
