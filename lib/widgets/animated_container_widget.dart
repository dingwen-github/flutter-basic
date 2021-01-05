import 'package:flutter/material.dart';
/// AnimatedContainer 隐式动画
/// @author: dingwen
/// @date: 2021/1/5

class AnimatedContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainerWidget'),
        leading: BackButton(),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 2,milliseconds: 30),
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.red,Colors.white],
              stops: [0.2,0.9],
            ),
            boxShadow: [BoxShadow(spreadRadius: 25,blurRadius: 25)],
            borderRadius: BorderRadius.all(Radius.circular(150))
          ),
          child: Center(
            child: Text('AnimatedContainerWidget'),
          ),
        ),
      ),
    );
  }
}
