import 'package:flutter/material.dart';
import 'package:flutter_basic/case/notification/my_notification.dart';

/// NotificationChild test
/// @author: dingwen
/// @date: 2020/12/24

class NotificationChild extends StatefulWidget {
  @override
  _NotificationChildState createState() => _NotificationChildState();
}

class _NotificationChildState extends State<NotificationChild> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return FloatingActionButton(
          child: Icon(Icons.sentiment_dissatisfied),
          onPressed: () => MyNotification(msg: 'child').dispatch(context),
        );
      },
    );
  }
}
