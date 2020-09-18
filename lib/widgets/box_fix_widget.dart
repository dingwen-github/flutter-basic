import 'package:flutter/material.dart';
///Flutter 基础 BoxFix 使用
class BoxFixWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BoxFix'),
        leading: BackButton(),
      ),
      body: Container(
        /*
        BoxFit.fill:充满父容器。
        BoxFit.contain:尽可能大，保持图片分辨率。
        BoxFit.cover:充满容器，可能会被截断。
        BoxFit.none:图片居中显示，不改变分大小，可能会被截断。
        BoxFit.fitWidth:图片填满宽度，高度可能会被截断
        BoxFit.fitHeight:图片填满高度，宽度可能会被截断
        BoxFit.scaleDown:图片可以完整显示，但是可能不能填充满。
         */
        child: Image.asset('images/mac.jpeg',fit: BoxFit.contain,),
      ),
    );
  }
}
