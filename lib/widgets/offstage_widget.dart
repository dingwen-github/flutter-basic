import 'package:flutter/material.dart';

///Offstage 用于控制，child是否显示
/// offstage 为true控件隐藏，false显示
/// 当offstage为true，不可见的时候，如果child有动画，需要手动停掉，Offstage不会停掉

class OffstageWidget extends StatefulWidget {
  @override
  _OffstageWidgetState createState() => _OffstageWidgetState();
}

class _OffstageWidgetState extends State<OffstageWidget> {
  bool _offstage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offstage使用'),
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Offstage(
            offstage: _offstage,
            child: Text('offstage'),
          ),
          RaisedButton(
            child: Text('点我:当前offstage=$_offstage'),
            onPressed: (){
              setState(() {
                _offstage = !_offstage;
              });
            },
          )
        ],
      ),
    );
  }
}
