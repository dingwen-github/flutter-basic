import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础 animation demo 01
class AnimationDemoOne extends StatefulWidget {
  @override
  _AnimationDemoOneState createState() => _AnimationDemoOneState();
}

class _AnimationDemoOneState extends State<AnimationDemoOne>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;
  AnimationStatus _animationStatus;
  double _animationValue;

  @override
  void initState() {
    super.initState();

    ///初始化动画控制，两秒
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    ///补间动画
    _animation = Tween<double>(begin: 0, end: 300).animate(_animationController)
      ..addListener(() {
        setState(() {
          _animationValue = _animation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
       setState(() {
         _animationStatus = status;
       });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation demo one'),
        leading: BackButton(),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: (){
                ///重置动画
                _animationController.reset();
                ///播放动画
                _animationController.forward();
              },
              child: Text('Start',textDirection: TextDirection.ltr,),
            ),
            Text('State:${_animationStatus.toString()}',textDirection: TextDirection.ltr,),
            Text('State:${_animationValue.toString()}',textDirection: TextDirection.ltr,),
            Container(
              height: _animation.value,
              width: _animation.value,
              child: FlutterLogo(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
