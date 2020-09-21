import 'package:flutter/material.dart';

///Flutter MainAxisAlignment 使用
///这个属性不是Row特有，Column中也有，只不过Row的主轴是水平方向上面的，Column是竖直方向上的。MainAxisAlignment属性就是代表主轴方向的对齐方式。本文我们将以Row为例来讲解，Columu其实也是一样的意思，只不过方向不一样
const NAMES = ['ding', 'wen', 'mao', 'rui'];

class MainAxisAlignmentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainAxisAlignment Widget'),
        leading: BackButton(),
      ),

      ///如果是Row布局，主轴则是水平方向
      ///如果是Column布局，主轴则是垂直方向
      body: Row(
        ///左 ----> 右  start end
        ///上 ----> 下 start end
        ///子元素无间距，均匀排列
//        mainAxisAlignment: MainAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.end,
        //居中
//      mainAxisAlignment: MainAxisAlignment.center,
        ///子元素均匀占据空间，各个子元素之间间距相等。第一个元素左边和最后一个元素右边无间距
        ///如果只有两个元素的情况下，则一个居左显示一个居右边显示
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,

        ///与spaceBetween的区别就是，第一个子widget的左边和最后一个widget的右边也有一半的空间
//      mainAxisAlignment: MainAxisAlignment.spaceAround,
        ///所有子元素包括第一个和最后一个元素都平均占据
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
