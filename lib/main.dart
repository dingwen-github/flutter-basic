import 'package:flutter/material.dart';
import 'package:flutter_basic/app_lifecycle.dart';
import 'package:flutter_basic/demoes/http_future_builder_demo.dart';
import 'package:flutter_basic/demoes/pull_drop_demo.dart';
import 'package:flutter_basic/flutter_widget_lifecycle.dart';
import 'package:flutter_basic/gesture_page.dart';
import 'package:flutter_basic/launch_page.dart';
import 'package:flutter_basic/less_group_page.dart';
import 'package:flutter_basic/photo_app.dart';
import 'package:flutter_basic/resouces_page.dart';
import 'package:flutter_basic/stateful_group_page.dart';
import 'package:flutter_basic/water_mark.dart';
import 'package:flutter_basic/webview_demo.dart';
import 'package:flutter_basic/demoes/animated_builder_demo.dart';
import 'package:flutter_basic/demoes/animated_widget_Demo.dart';
import 'package:flutter_basic/widgets/align_widget.dart';
import 'package:flutter_basic/widgets/box_fix_widget.dart';
import 'package:flutter_basic/widgets/button_widget.dart';
import 'package:flutter_basic/widgets/checkbox_list_tile_widget.dart';
import 'package:flutter_basic/widgets/container_widget.dart';
import 'package:flutter_basic/widgets/cross_axis_alignment_widget.dart';
import 'package:flutter_basic/widgets/custom_painter_widget.dart';
import 'package:flutter_basic/widgets/expansion_tile_widget.dart';
import 'package:flutter_basic/widgets/grid_view_widget.dart';
import 'package:flutter_basic/widgets/image_widget.dart';
import 'package:flutter_basic/widgets/list_tile_widget.dart';
import 'package:flutter_basic/widgets/list_view_widget.dart';
import 'package:flutter_basic/widgets/main_axis_alignment_widget.dart';
import 'package:flutter_basic/widgets/material_app_widget.dart';
import 'package:flutter_basic/widgets/photo_hero.dart';
import 'package:flutter_basic/widgets/physical_model_widget.dart';
import 'package:flutter_basic/widgets/radial_hero.dart';
import 'package:flutter_basic/widgets/scaffold_appbar_widget.dart';
import 'package:flutter_basic/widgets/scaffold_bottom_app_bar.dart';
import 'package:flutter_basic/widgets/scaffold_bottom_navigation_bar_widget.dart';
import 'package:flutter_basic/widgets/scaffold_drawer_widget.dart';
import 'package:flutter_basic/widgets/text_widget.dart';
import 'package:flutter_basic/widgets/text_field_widget.dart';
import 'package:flutter_basic/widgets/top_navigation.dart';
import 'package:scoped_model/scoped_model.dart';

import 'case/tabbar-bottomnavigationbar/tab_bootom_nv_page.dart';
import 'case/webview-js/webview_js_interaction.dart';
import 'demoes/animation_demo_one.dart';
import 'demoes/http_future_demo.dart';
import 'demoes/list_view_demo.dart';
import 'demoes/shared_preferences_demo.dart';
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
        'checkbox_list_tile': (BuildContext context) =>
            CustomCheckBoxListTile(),
        'scaffold_widget': (BuildContext context) => ScaffoldWidget(),
        'scaffold_draw_widget': (BuildContext context) =>
            ScaffoldDrawerWidget(),
        'tab_bar_bottom_navigation_bar': (BuildContext context) =>
            TabBootomNvPage(),
        'scaffold_bottom_navigation_bar_widget': (BuildContext context) =>
            ScaffoldBottomNavigationBarWidget(),
        'scaffold_bottom_app_bar': (BuildContext context) =>
            ScaffoldBottomAppBar(),
        'web_view_js_interaction': (BuildContext context) =>
            WebViewJsInteraction(),
        'material_app_widget': (BuildContext context) => MaterialAppWidget(),
        'container_widget': (BuildContext context) => ContainerWidget(),
        'text_widget': (BuildContext context) => TextWidget(),
        'button_widget': (BuildContext context) => ButtonWidget(),
        'text_field_widget': (BuildContext context) => TextFieldWidget(),
        'image_widget': (BuildContext context) => ImageWidget(),
        'animation_demo_one_widget': (BuildContext context) =>
            AnimationDemoOne(),
        'animated_widget': (BuildContext context) => AnimatedWidgetDemo(),
        'animated_build': (BuildContext context) => AnimatedBuildDemo(),
        'PhotoHero': (BuildContext context) => HeroAnimation(),
        'Radial': (BuildContext context) => RadialExpansionDemo(),
        'top_navigation': (BuildContext context) => TopNavigation(),
        'http_future': (BuildContext context) => HttpFutureDemo(),
        'http_future_builder': (BuildContext context) =>
            HttpFutureBuilderDemo(),
        'shared_preferences_demo': (BuildContext context) =>
            HttpFutureBuilderDemo(),
        'list_view_demo': (BuildContext context) => ListViewDemo(),
        'expansion_tile_widget': (BuildContext context) =>
            ExpansionTileWidget(),
        'grid_view_widget': (BuildContext context) => GridViewWidget(),
        'pull_drop_demo': (BuildContext context) => PullDropDemo(),
        'physical_model_widget': (BuildContext context) =>
            PhysicalModelWidget(),
        'box_fix_widget': (BuildContext context) => BoxFixWidget(),
        'custom_painter_widget': (BuildContext context) =>
            CustomPainterWidget(),
        'alignment_widget': (BuildContext context) => AlignWidget(),
        'main_axis_alignment_widget': (BuildContext context) =>
            MainAxisAlignmentWidget(),
        'cross_axis_alignment_widget': (BuildContext context) =>
            CrossAxisAlignmentWidget(),
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
        _item(
            'CheckBoxListTile', CustomCheckBoxListTile(), 'checkbox_list_tile'),
        _item('Scaffold', ScaffoldWidget(), 'scaffold_widget'),
        _item('Scaffold Drawer', ScaffoldDrawerWidget(),
            'scaffold_drawer_widget'),
        _item('tab_bar_bottom_navigation_bar', TabBootomNvPage(),
            'tab_bar_bottom_navigation_bar'),
        _item(
            'scaffold_bottom_navigation_bar_widget',
            ScaffoldBottomNavigationBarWidget(),
            'scaffold_bottom_navigation_bar_widget'),
        _item('scaffold_bottom_app_bar', ScaffoldBottomAppBar(),
            'scaffold_bottom_app_bar'),
        _item('web_view_js_interaction', WebViewJsInteraction(),
            'web_view_js_interaction'),
        _item('MaterialApp', MaterialAppWidget(), 'material_app_widget'),
        _item('Container', ContainerWidget(), 'container_widget'),
        _item('Text', TextWidget(), 'text_widget'),
        _item('Button', ButtonWidget(), 'button_widget'),
        _item('TextFiled', TextFieldWidget(), 'text_field_widget'),
        _item('Image', ImageWidget(), 'image_widget'),
        _item('Animation', AnimationDemoOne(), 'animation_demo_one_widget'),
        _item('AnimatedWidget', AnimatedWidgetDemo(), 'animated_widget'),
        _item('AnimatedBuilder', AnimatedBuildDemo(), 'animated_build'),
        _item('PhotoHero', HeroAnimation(), 'PhotoHero'),
        _item('Radial', RadialExpansionDemo(), 'Radial'),
        _item('top_navigation', TopNavigation(), 'top_navigation'),
        _item('http_future', HttpFutureDemo(), 'http_future'),
        _item('http_future_builder', HttpFutureBuilderDemo(),
            'http_future_builder'),
        _item('shared_preferences_demo', SharedPreferencesDemo(),
            'shared_preferences_demo'),
        _item('list_view_demo', ListViewDemo(), 'list_view_demo'),
        _item('ExpansionTile', ExpansionTileWidget(), 'expansion_tile_widget'),
        _item('GridView', GridViewWidget(), 'grid_view_widget'),
        _item('pull_drop_demo', PullDropDemo(), 'pull_drop_demo'),
        _item('physical_model_widget', PhysicalModelWidget(),
            'physical_model_widget'),
        _item('box_fix_widget', BoxFixWidget(), 'box_fix_widget'),
        _item('custom_painter_widget', CustomPainterWidget(),
            'custom_painter_widget'),
        _item('alignment_widget', AlignWidget(), 'alignment_widget'),
        _item('main_axis_alignment_widget', MainAxisAlignmentWidget(),
            'main_axis_alignment_widget'),
        _item('cross_axis_alignment_widget', CrossAxisAlignmentWidget(),
            'cross_axis_alignment_widget'),
      ],
    );
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
