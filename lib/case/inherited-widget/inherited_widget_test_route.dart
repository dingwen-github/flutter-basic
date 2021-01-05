import 'package:flutter/material.dart';
import 'package:flutter_basic/case/inherited-widget/share_data_widget.dart';
import 'package:flutter_basic/case/inherited-widget/test_widget.dart';

/// 作为[InheritedWidget]的父widget测试
/// @author: dingwen
/// @date: 2020/12/24

class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() =>
      _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidgetTestRoute'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Center(
        //使用InheritedWidget
        child: ShareDataWidget(
          TestWidget(),
          data: count,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() => count++),
      ),
    );
  }
}
