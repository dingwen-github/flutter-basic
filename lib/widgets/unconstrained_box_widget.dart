import 'package:flutter/material.dart';
/// UnconstrainedBox 组件不对子组件做任何约束,子部件超出会被截取，可以设置对其方式
/// @author: dingwen
/// @date: 2021/1/5

class UnconstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnconstrainedBoxWidget'),
        leading: BackButton(),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: UnconstrainedBox(
            alignment: Alignment.center,
            child: Container(
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}
