import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础-button
class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button'),
        leading: BackButton(),
      ),
      body: Column(
        children: <Widget>[
          ///它默认带有阴影和灰色背景。按下后，阴影会变大
          RaisedButton(
            child: Text('RaiseButton'),
            onPressed: () => print('RaiseButton'),
          ),

          ///FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
          FlatButton(
            //按钮显示的文字
            child: Text('FlatButton'),
            //按钮文字颜色
            textColor: Colors.white,
            //按钮禁用时的背景颜色
            disabledColor: Colors.grey,
            //正常状态下的背景颜色
            color: Colors.blue,
            //按钮按下的背景颜色
            highlightColor: Colors.blue[300],
            //按钮主题，默认是浅色主题
            colorBrightness: Brightness.dark,
            //外形
            splashColor: Colors.grey,
            //圆角边框
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
            //点击事件
            onLongPress: () => print('FlatButton'),
          ),

          ///OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
          OutlineButton(
            child: Text('OutlineButton'),
            highlightElevation: 60.0,
            onPressed: () => print('OutlineButton'),
          ),

          ///IconButton
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => print('点赞'),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
