import 'package:flutter/material.dart';
/// AspectRatio 固定子组件的宽高比例
/// @author: dingwen
/// @date: 2021/1/5

class AspectRatioWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatioWidget'),
        leading: BackButton(),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 1 / 2 ,
          child: Container(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
