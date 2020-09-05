import 'package:flutter/material.dart';
import 'package:flutter_basic/gesture_page.dart';
import 'package:flutter_basic/less_group_page.dart';
import 'package:flutter_basic/resouces_page.dart';
import 'package:flutter_basic/stateful_group_page.dart';

import 'layout_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RouteNavigator(),
      //配置路由
      routes: <String,WidgetBuilder>{
        'less':(BuildContext context) => LessGroupPage(),
        'ful':(BuildContext context) => StatefulGroupPage(),
        'layout':(BuildContext context) => LayoutWidget(),
        'gesture':(BuildContext context) => GesturePage(),
        'resource':(BuildContext context) => ResourcePage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {

  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter路由与导航'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SwitchListTile(value: byName,onChanged: (value){
              setState(() {
                byName = value;
              });
            },
            title: Text('${byName ?'' :'不'}通过路由名跳转'),),
            _item('StatelessWidget与基础组件',LessGroupPage(),'less'),
            _item('StatefulWidget与基础组件',StatefulGroupPage(),'ful'),
            _item('LayoutWidget与基础组件',LayoutWidget(),'layout'),
            _item('如何检测用户手势以及处理点击事件',GesturePage(),'gesture'),
            _item('resource导入',ResourcePage(),'resource'),
          ],
        ),
      ),
    );
  }

  _item(String title, Widget page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(byName){
            Navigator.pushNamed(context, routeName);
          }else{
            Navigator.push(context,MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
