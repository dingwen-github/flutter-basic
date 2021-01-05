import 'package:flutter/material.dart';
import 'dart:math' as Math;
///有状态的ContainerWidget
///dingwen
///2020/12/24
class ContainerWidget extends StatefulWidget {
  ///可选参数需要在最后
  ContainerWidget({Key key,this.color}):super(key: key);
  final Color color;
  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return _buildContainer(color: widget.color);


  }

  ///构建Container
  ///[color]如果为空则随机产生一个在Colors.primaries里面的颜色
  Container _buildContainer(
      {double width = 160, double height = 160, Color color}) {
    return Container(
      width: width,
      height: height,
      color: color ??
          Colors.primaries[Math.Random().nextInt(Colors.primaries.length)],
      child: Center(
        child: RaisedButton(
          child: Text(_count.toString()),
          onPressed: (){
            setState(() {
              _count++;
            });
          },
        ),
      ),
    );
  }
}
