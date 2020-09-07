# flutter-basic
flutter-basic创建于2020/08/23
## 基本命令

>
   `
   flutter create 项目名称
   flutter run
   flutter run -d 设备名称
   `

## 插件包地址 pub.dev

   [pub.dev](http://www.pub.dev)
    
## 常用组件，详细见代码

### StatelessWidget

>
   + 1.Container
   + 2.Text
   + 3.CloseButton
   + 4.BackButton
   + 5.Chip
   + 6.Divider
   + 7.Card
   + 8.AlertDialog
   + 9.Column
   + 10.Icon
   
   
## StatefulWidget

>
   + 1.MaterialApp
   + 2.Scaffold
   + 3.BottomNavigationBar
   + 4.BottomNavigationBarItem
   + 5.FloatingActionButton
   + 6.TextField
   + 7.PageView
   + 8.Image
   
## 布局组件

> 
   + 1.Column
   + 2.Row
   + 3.ClipOval、ClipRect(裁剪)
   + 4.FractionallySizedBox
   + 5.Stack
   + 6.Wrap
   + 7.Expanded
   
   
## 手势


>
   + 1.GestureDetector
   
   
## 问题


>
     Starting a Gradle Daemon, 5 busy and 1 incompatible and 1 stopped Daemons could not be reused, use --status for details
     
   
   [解决](https://segmentfault.com/a/1190000022604574?utm_source=tag-newest)
   `cordova clean`
   

## google 字体库

[地址](http://www.googlefonts.net/)


## `widget`合集

+ 1. `ListTile`

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础组件-ListTitle
///一个固定高度呢行，通常包含标题、副标题、行前图标、行后图标
class ListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件-ListTitle'),
        leading: BackButton(),
      ),
      body: Container(
        child: ListTile(
          ///最左侧的头部，参数是一个widget
          leading: Icon(Icons.cake,),
          ///标题,参数widget
          title: Text('标题'),
            ///副标题，widget
          subtitle: Row(
            children: <Widget>[
              Text('副标题'),
              Icon(Icons.person),
          ],
        ),
          ///展示在title后面的后置组件 widget
          trailing: Icon(Icons.save),
          ///点击事件
          onTap: ()=> print('点击事件'),
          onLongPress: ()=> print('长按'),
          ///默认是false,是否默认三行高度，subtitle不为空是才能使用 bool
          isThreeLine: true,
          ///bool，让List tiles 有更小的高度
          dense: true,
          ///默认为true ,是否能被点击
          enabled: true,
          ///默认值为false，是否默认被选中,呈现当前的主题颜色
          selected: true,
        ),
      ),
    );
  }
}

```


