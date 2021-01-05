import 'package:flutter/material.dart';
import 'package:flutter_basic/case/notification/my_notification.dart';
import 'package:flutter_basic/case/notification/notification_child.dart';

/// NotificationRoute 测试
/// @author: dingwen
/// @date: 2020/12/24

class NotificationRoute extends StatefulWidget {
  @override
  _NotificationRouteState createState() => _NotificationRouteState();
}

class _NotificationRouteState extends State<NotificationRoute> {
  String _msg = '';

  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg;
        });
        //true 表示阻止冒泡
        //false表示不阻止冒泡
        return true;
      },
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('NotificationRoute'),
              centerTitle: true,
              leading: BackButton(),
            ),
            body: Center(
              child: Column(
                children: [
                  Text('$_msg'),
                  NotificationChild(),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.backup),
              onPressed: () {
                //分发通知
                MyNotification(msg: 'REFLECT').dispatch(context);
//              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationChild()));
              },
            ),
          );
        },
      ),
    );
  }
}
