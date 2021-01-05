import 'package:flutter/material.dart';
/// SizeBox 固定子元素宽高
/// @author: dingwen
/// @date: 2021/1/5

class SizeBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SizeBoxWidget'),
        leading: BackButton(),
      ),
      body: Center(
        child: SizedBox(
          width: 20,
          height: 20,
          child: Text('SizeBoxWidget'),
        ),
      ),
    );
  }
}
