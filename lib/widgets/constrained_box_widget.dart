import 'package:flutter/material.dart';
/// ConstrainedBox 用来约束子部件的大小
/// @author: dingwen
/// @date: 2021/1/5

class ConstrainedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBoxWidget'),
        leading: BackButton(),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 100,minHeight: 100),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
