import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 动画基础 AnimatedBuild
class AnimatedBuildDemo extends StatefulWidget {
  @override
  _AnimatedBuildDemoState createState() => _AnimatedBuildDemoState();
}

class _AnimatedBuildDemoState extends State<AnimatedBuildDemo>with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0,end: 300).animate(_animationController);
    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return GrowTransition(animation: _animation,child: FlutterLogo(),);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}


class LogWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }

}


class GrowTransition extends StatelessWidget{
  GrowTransition({this.child,this.animation});
  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context,child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    );
  }

}
