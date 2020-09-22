import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础 MaterialApp
///MaterialApp是我们使用 Flutter开发中最常用的符合Material Design设计理念的入口Widget。你可以将它类比成为网页中的，且它自带路由、主题色
class MaterialAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      ///应用默认所显示的界面 页面
        home: Scaffold(
          appBar: AppBar(
            title: Text('MaterialApp'),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
              child: Text('应用默认所显示的界面 页面'),
            ),
          ),

          ///路由
        ),
        routes: {},

        ///初始路由
        initialRoute: '',

        /// 应用各种 UI 所使用的主题颜色
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.grey[850],
          accentColor: Colors.grey[850],
          indicatorColor: Colors.white,
        ));
  }
}
