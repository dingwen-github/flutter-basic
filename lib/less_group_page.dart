import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///StatelessWidget与基础组件
class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //定义Text样式，方便重用
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          /*
            装饰器
            BoxDecoration常用装饰器
           */
          decoration: BoxDecoration(color: Colors.white),
          //对齐方式
          alignment: Alignment.center,
          //上下布局
          child: Column(
            children: <Widget>[
              Text('I an Text', style: textStyle,),
              Icon(Icons.android, size: 50, color: Colors.red,),
              //关闭按钮
              CloseButton(),
              //返回按钮
              BackButton(),
              //材料设计中非常有趣的小部件
              Chip(
                avatar: Icon(Icons.people),
                label: Text('StatelessWidget与基础组件'),
              ),
              //分割线组件
              Divider(
                //只能设置容器高度，不能设置线的高度。可以通过画一个Container来实现
                height: 10,
                //左侧边距
                indent: 10,
                color: Colors.deepOrange,
              ),
              //带有圆角，阴影，边框等效果的卡片
              Card(
                color: Colors.blue,
                //阴影
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    ' I am Card',
                    style: textStyle,
                  ),
                ),
              ),
              //alert弹框
              AlertDialog(
                title: Text('一个字干'),
                content: Text('你这个糟老头子坏得很'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
