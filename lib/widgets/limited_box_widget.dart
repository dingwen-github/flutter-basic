import 'package:flutter/material.dart';
/// 当父Widget是不受约束的Widget时候，LimitedBox才会生效。在容器不受约束时，大小将会设置0
/// @author: dingwen
/// @date: 2021/1/5

class LimitedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LimitedBoxWidget'),
        leading: BackButton(),
      ),
      body: Center(
//        child: Container(
//          width: 100,
//          height: 100,
//          ///此处LimitedBox 不会生效，父Widget不是不受约束组件
//          child: LimitedBox(
//            child: Container(
//              color: Colors.red,
//              width: 50,
//              height: 50,
//            ),
//          ),
//        ),
      child: ListView(
        children: [
          LimitedBox(
            maxHeight: 60,
            child: Container(
              color: Colors.pink,
            ),
          ),
          LimitedBox(
            maxWidth: 100,
            maxHeight: 10,
            child: Container(
              color: Colors.red,
            ),
          ),
        ],
      ),
      ),
    );
  }
}
