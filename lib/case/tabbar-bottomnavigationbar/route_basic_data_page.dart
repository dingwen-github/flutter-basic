import 'package:flutter/material.dart';

/**
 * 基本路由
 * */
class RouteBasicDataPage extends StatefulWidget {
  String title;

  RouteBasicDataPage({this.title = "默认值：基本路由不传值"});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RouteDataContentPage(mTitle: title);
  }
}

class RouteDataContentPage extends State {
  String mTitle;

  RouteDataContentPage({this.mTitle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(), // 返回上一级
        child: Text("返回"),
      ),
      appBar: AppBar(
        title: Text(mTitle),
//        leading: IconButton(
//          onPressed: () => Navigator.of(context).pop(),
//          icon: Container(
//            child: Icon(
//              Icons.arrow_back,
//              color: Colors.cyanAccent,
//            ),
//          ),
//        ),
      ),
      body: Text(mTitle),
    );
  }
}
