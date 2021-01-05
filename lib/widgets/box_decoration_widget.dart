import 'package:flutter/material.dart';
/// Flutter BoxDecoration
/// @author: dingwen
/// @date: 2021/1/5

class BoxDecorationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BoxDecoration'),
        leading: BackButton(),
      ),
      body: Center(
        child: Container(
          width: 600,
          height: 600,
          ///背景颜色和[BoxDecoration]中的颜色不能同时设置
          decoration: BoxDecoration(
//            color: Colors.blue,
//            image: DecorationImage(
              ///本地图片
//              image: AssetImage('images/admin.jpg'),
            ///网络图片
//              image: NetworkImage('https://avatar.csdn.net/8/9/A/3_chenlove1.jpg'),

//              fit: BoxFit.fill
//            ),
          border: Border.all(color: Colors.redAccent,width: 2,style: BorderStyle.solid),
//            borderRadius: BorderRadius.circular(60),
            ///多层阴影
              ///颜色
              ///阴影模糊度 越大越容易扩散透明
              ///阴影模糊大小
              ///阴影位置
            boxShadow: [
              BoxShadow(color: Colors.grey,blurRadius: 10.0,spreadRadius: 10.0,offset: Offset(2,2)),
              BoxShadow(color: Colors.orange,blurRadius: 2.0,spreadRadius: 2.0,offset: Offset(10,10))],

            ///不能和borderRadius一起使用
//            shape: BoxShape.circle,
            ///渐变
            ///环形渐变
            gradient: RadialGradient(colors: [Colors.blueAccent,Colors.white,Colors.grey],radius: 2,tileMode: TileMode.mirror),
            ///扫描式渐变
//            gradient: SweepGradient(colors: [Colors.deepOrange,Colors.redAccent],startAngle: 0.0,endAngle: 2*3.14),
            ///线性渐变
//            gradient: LinearGradient(colors:  [Colors.deepOrange,Colors.redAccent],begin: FractionalOffset(1, 0), end: FractionalOffset(0, 1)),
          ),
        ),
      ),
    );
  }
}
