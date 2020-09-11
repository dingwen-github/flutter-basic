import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

///Flutter 基础 Container
///用来放置widget的容器，有padding、margin、位置、大小等参数
///当 Contrainer 组件的父布局设置了大小，那么 Contrainer 将使用父布局的大小设置，
///如果 父布局没有设置大小 ，自身设置了大小，那么 Contrainer 将使用自身设置的大小，
///如果 自身没有设置大小，那么 Contrainer 将包裹子 Widget 或者说是将使用子Widget 的大小设置
class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
        leading: BackButton(),
      ),
      ///Center让子组件居中
      body: Center(
        child: Container(
          width: 100.0,
          height: 100.0,
//        color: Colors.green,
          child: Text('Container',textAlign: TextAlign.center,),
          ///对齐方式,Container中的子组件的位置
          //居中
//          alignment: Alignment(0,0),
          //左上 默认
//        alignment: Alignment(-1,-1),
        //右上
//        alignment: Alignment(1,-1),
        //中左
//        alignment: Alignment(-1,0),
        //中右
//        alignment: Alignment(1,0),
        //左下
//        alignment: Alignment(-1,1),
        //右下
//        alignment: Alignment(1,1),
        ///外边距
          //上下左右均为10.0
//      margin: EdgeInsets.all(10.0),
        //上下左右分别设置
//      margin: EdgeInsets.fromLTRB(left, top, right, bottom),
        //指定水平方向、垂直方向上的边距 ，可以单独设置
//      margin: EdgeInsets.symmetric(horizontal: 100,vertical: 200),
        //一个参数是给定的widget的WindowPadding，第二个是屏幕的分辨率
//      margin: EdgeInsets.fromWindowPadding(WindowPadding.zero, 100.0),
        ///装饰器
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.green,
            border: Border.all(color: Colors.red,width: 5,style: BorderStyle.solid)
          ),
          ///内边距
          padding: EdgeInsets.only(left: 10.0),
        ),
      ),
    );
  }
}
