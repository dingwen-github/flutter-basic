import 'package:flutter/material.dart';
/// 控制子部件占父部件的比例
/// @author: dingwen
/// @date: 2021/1/5
class FractionallySizedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FractionallySizeBoxWidget'),
        leading: BackButton(),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: FractionallySizedBox(
            ///也可以设置对齐方式
            widthFactor: 0.5,
            heightFactor: .5,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
