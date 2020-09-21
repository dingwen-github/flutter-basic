import 'package:flutter/material.dart';
///Flutter 基础组件 align

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('alignment widget'),
        leading: BackButton(),
      ),
      body: Container(
        ///子元素居中显示
//        alignment: Alignment.center,//和 Alignment(0.0,0.0)等效
      ///子元素底部居中
//          alignment: Alignment.bottomCenter,//和 Alignment(0.0,1.0)等效
      ///子元素底部居左
//        alignment: Alignment.bottomLeft,//和Alignment(-1.0,1.0)等效
        ///子元素底部居右
//        alignment:Alignment.bottomRight,//和Alignment(1.0,1.0)等效
      ///子元素中部居左
//        alignment: Alignment.centerLeft,//Alignment(-1.0,0.0)
        width: 200,
        ///子元素中部居右
//        alignment: Alignment.centerRight,//Alignment(1.0,0.0)
      ///子元素上左
//        alignment: Alignment(-1.0,-1.0),//Alignment.topLeft
      ///子元素丄右
//        alignment: Alignment(1.0, -1.0),//Alignment.topRight
      alignment: Alignment.topCenter,//Alignment(0.0,-1.0)
        height: 100,
        color: Colors.cyan,
        child: Text('alignment widget'),
      ),
    );
  }
}
