import 'package:flutter/material.dart';
/// 隐式动画，组件之间的过渡
/// @author: dingwen
/// @date: 2021/1/10

class AnimatedSwitcherWidget extends StatefulWidget {
  @override
  _AnimatedSwitcherWidgetState createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedSwitcherWidget'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          color: Theme.of(context).accentColor,
          width: 300,
          height: 300,
          child: AnimatedSwitcher(
            transitionBuilder: (child,animation){
              return ScaleTransition(scale: animation,child: FadeTransition(
                opacity: animation,
                child: child,
              ),);
            },
            duration: Duration(milliseconds: 3000),
//              child: Center(child: Text('AnimatedSwitcherWidget test',key: UniqueKey(),))),
  child: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=1819216937,2118754409&fm=26&gp=0.jpg')),
        ),
      ),
    );
  }
}
