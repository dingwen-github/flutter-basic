import 'package:flutter/material.dart';
import 'package:flutter_basic/app_lifecycle.dart';
import 'package:flutter_basic/flutter_widget_lifecycle.dart';
import 'package:flutter_basic/gesture_page.dart';
import 'package:flutter_basic/launch_page.dart';
import 'package:flutter_basic/less_group_page.dart';
import 'package:flutter_basic/photo_app.dart';
import 'package:flutter_basic/resouces_page.dart';
import 'package:flutter_basic/stateful_group_page.dart';
import 'package:flutter_basic/water_mark.dart';
import 'package:flutter_basic/webview_demo.dart';
import 'package:flutter_basic/widgets/checkbox_list_tile_widget.dart';
import 'package:flutter_basic/widgets/list_tile_widget.dart';
import 'package:flutter_basic/widgets/list_view_widget.dart';
import 'package:flutter_basic/widgets/scaffold_appbar_widget.dart';
import 'package:flutter_basic/widgets/scaffold_bottom_app_bar.dart';
import 'package:flutter_basic/widgets/scaffold_bottom_navigation_bar_widget.dart';
import 'package:flutter_basic/widgets/scaffold_drawer_widget.dart';

import 'case/tabbar-bottomnavigationbar/tab_bootom_nv_page.dart';
import 'layout_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //设置全局字体
//        fontFamily: 'Lobster',
        //主题
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (_brightness == Brightness.light) {
                    _brightness = Brightness.dark;
                  } else {
                    _brightness = Brightness.light;
                  }
                });
              },
              //局部字体设置
              child: Text(
                '切换主题dingwen',
                style: TextStyle(fontFamily: 'Lobster'),
              ),
            ),
            Expanded(child: RouteNavigator()),
          ],
        ),
      ),
      //配置路由
      routes: <String, WidgetBuilder>{
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroupPage(),
        'layout': (BuildContext context) => LayoutWidget(),
        'gesture': (BuildContext context) => GesturePage(),
        'resource': (BuildContext context) => ResourcePage(),
        'launch': (BuildContext context) => LaunchPage(),
        'life': (BuildContext context) => FlutterWidgetLifeCycle(),
        'app_life': (BuildContext context) => AppLifecycle(),
        'photo': (BuildContext context) => PhotoApp(),
        'water_mark': (BuildContext context) => WaterMark(),
        'list_tile_widget': (BuildContext context) => ListTileWidget(),
        'list_view_widget': (BuildContext context) => ListViewWidget(),
        'web_view_demo': (BuildContext context) => WebViewDemo(),
        'checkbox_list_tile': (BuildContext context) => CustomCheckBoxListTile(),
        'scaffold_widget': (BuildContext context) => ScaffoldWidget(),
        'scaffold_draw_widget': (BuildContext context) => ScaffoldDrawerWidget(),
        'tab_bar_bottom_navigation_bar': (BuildContext context) => TabBootomNvPage(),
        'scaffold_bottom_navigation_bar_widget': (BuildContext context) => ScaffoldBottomNavigationBarWidget(),
        'scaffold_bottom_app_bar': (BuildContext context) => ScaffoldBottomAppBar(),
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
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        SwitchListTile(
          value: byName,
          onChanged: (value) {
            setState(() {
              byName = value;
            });
          },
          title: Text('${byName ? '' : '不'}通过路由名跳转'),
        ),
        _item('StatelessWidget与基础组件', LessGroupPage(), 'less'),
        _item('StatefulWidget与基础组件', StatefulGroupPage(), 'ful'),
        _item('LayoutWidget与基础组件', LayoutWidget(), 'layout'),
        _item('如何检测用户手势以及处理点击事件', GesturePage(), 'gesture'),
        _item('resource导入', ResourcePage(), 'resource'),
        _item('如何打开第三方软件', LaunchPage(), 'launch'),
        _item('Flutter 页面生命周期', FlutterWidgetLifeCycle(), 'life'),
        _item('App生命周期', AppLifecycle(), 'app_life'),
        _item('拍照App', PhotoApp(), 'photo'),
        _item('Flutter 页面水印', WaterMark(), 'water_mark'),
        _item('ListTile', ListTileWidget(), 'list_tile_widget'),
        _item('ListView', ListViewWidget(), 'list_view_widget'),
        _item('WebView', WebViewDemo(), 'web_view_demo'),
        _item('CheckBoxListTile', CustomCheckBoxListTile(), 'checkbox_list_tile'),
        _item('Scaffold', ScaffoldWidget(), 'scaffold_widget'),
        _item('Scaffold Drawer', ScaffoldDrawerWidget(), 'scaffold_drawer_widget'),
        _item('tab_bar_bottom_navigation_bar', TabBootomNvPage(), 'tab_bar_bottom_navigation_bar'),
        _item('scaffold_bottom_navigation_bar_widget', ScaffoldBottomNavigationBarWidget(), 'scaffold_bottom_navigation_bar_widget'),
        _item('scaffold_bottom_app_bar', ScaffoldBottomAppBar(), 'scaffold_bottom_app_bar'),
      ],
    );
//      child: Column(
//        children: <Widget>[
//          SwitchListTile(value: byName,onChanged: (value){
//            setState(() {
//              byName = value;
//            });
//          },
//            title: Text('${byName ?'' :'不'}通过路由名跳转'),),
//          _item('StatelessWidget与基础组件',LessGroupPage(),'less'),
//          _item('StatefulWidget与基础组件',StatefulGroupPage(),'ful'),
//          _item('LayoutWidget与基础组件',LayoutWidget(),'layout'),
//          _item('如何检测用户手势以及处理点击事件',GesturePage(),'gesture'),
//          _item('resource导入',ResourcePage(),'resource'),
//          _item('如何打开第三方软件', LaunchPage(), 'launch'),
//          _item('Flutter 页面生命周期', FlutterWidgetLifeCycle(), 'life'),
//          _item('App生命周期', AppLifecycle(), 'app_life'),
//          _item('拍照App', PhotoApp(), 'photo'),
//          _item('Flutter 页面水印', WaterMark(), 'water_mark'),
//          _item('ListTile', ListTileWidget(), 'list_tile_widget'),
//          _item('ListView', ListViewWidget(), 'list_view_widget'),
//          _item('WebView', WebViewDemo(), 'web_view_demo'),
//          _item('CheckBoxListTile', CustomCheckBoxListTile(), 'checkbox_list_tile'),
//          _item('Scaffold', ScaffoldWidget(), 'scaffold_widget'),
//        ],
//      ),
  }

  _item(String title, Widget page, String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
