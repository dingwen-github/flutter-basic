import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

///Flutter CrossAxisAlignment 使用
///，在Row（水平排列）控件中，CrossAxisAlignment的方向就是垂直的，在 Column（垂直排列）控件中，CrossAxisAlignment的方向就是水平的
const NAMES = ['ding', 'wen', 'mao', 'rui'];

class CrossAxisAlignmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CrossAxisAlignment Widget'),
        leading: BackButton(),
      ),

      ///如果是Row布局，交叉轴则是垂直方向
      ///如果是Column布局，交叉轴则是水平方向
      body: Row(
        ///将子控件放在交叉轴的起始位置
//        crossAxisAlignment: CrossAxisAlignment.start,
        ///将子控件放在交叉轴的结束位置
//          crossAxisAlignment: CrossAxisAlignment.center
         /// 使子控件填满交叉轴
        crossAxisAlignment: CrossAxisAlignment.stretch,
        ///textDirection就是用来控制水平方向的起始位置和排列方向
        //       textDirection: TextDirection.rtl,
        ///verticalDirection就是用来控制垂直方向的起始位置和排列方向
        verticalDirection: VerticalDirection.up,

        children: _items(),
      ),
    );
  }

  _items() {
    return NAMES.map((name) => _item(name)).toList();
  }

  Widget _item(String name) {
    return Container(
      ///子元素居中
      alignment: Alignment.center,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink, Colors.red],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      width: 80,
      height: 40,
      child: Text(name),
    );
  }
}
