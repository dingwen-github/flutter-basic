import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础组件--Scaffold
class ScaffoldWidget extends StatefulWidget {
  @override
  _ScaffoldWidgetState createState() => _ScaffoldWidgetState();
}

class _ScaffoldWidgetState extends State<ScaffoldWidget>
    with SingleTickerProviderStateMixin {
  ///AppBar bottom
  TabController _tabController;
  List _tabs = ['新闻', '老师', '公务员'];
  @override
  void initState() {
    ///初始化tabController
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ///没有scaffold黑色背景，只显示内容
//    return Container(
//      child: Text('123'),
//    );
    return Scaffold(
      ///顶部标题
      appBar: AppBar(
        ///顶部标题 widget
        title: Text('scaffold'),

        ///导航栏左边的控件 widget
        ///返回箭头默认就有，带有返回功能
        leading: IconButton(
          icon: Icon(Icons.save),
          onPressed: () => print('save'),
        ),

        ///标题居中
        centerTitle: true,

        ///顶部导航栏显示在右边的一组控件
        actions: <Widget>[
          RaisedButton(
            child: Text('点我'),
            onPressed: () => print('点我'),
          ),
          Icon(Icons.search),

          ///PopupMenuButton
          PopupMenuButton(
            ///长按提示
            tooltip: '长按提示',

            ///默认为三个点的图标
            icon: Icon(Icons.share),

            ///初始值，item中的当前初始值会高亮显示
            initialValue: 'qq',

            ///内边距
            padding: EdgeInsets.all(10.0),

            ///阴影
            elevation: 10.0,

            ///偏移量
            offset: Offset(10.0, 100.0),

            ///主题设置默认为true
            captureInheritedThemes: true,

            ///点击选项的回调
            onSelected: (value) {
              switch (value) {
                case 'qq':
                  print('qq');
                  break;
                case 'pyq':
                  print('pyq');
                  break;
              }
            },

            ///点击外部去取消的回调
            onCanceled: () {},

            ///默认为true 是否支持点击事件
            enabled: true,

            ///定义按钮的shape，设置shape时，默认的elevation将会失效，默认为CircleBorder
            ///ShapeBorder 抽象类 形状轮廓的基类
            ///BeveledRectangleBorder 顶端斜角
            ///BoxBorder
            ///CircleBorder 圆形
            ///InputBorder
            ///RoundedRectangleBorder 顶端圆角
            ///StadiumBorder 体育场型
            shape: CircleBorder(
              side: BorderSide(
                width: 2,
                color: Colors.blue,
                style: BorderStyle.solid,
              ),
            ),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  child: ListTile(
                    leading: Icon(Icons.check),
                    title: Text('QQ'),
                  ),
                  value: 'qq',
                ),
                PopupMenuItem<String>(
                  child: Text('朋友圈'),
                  value: 'pyq',
                ),
              ];
            },
          ),
        ],

        ///阴影
        elevation: 10.0,

        ///配合TabBar控件在顶部导航栏下方类似pageView的导航栏
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
          onTap: (index) {},
        ),
      ),

      ///底部导航条
      ///通常接收BottomNavigationBar()作为参数，配置底部导航栏
      ///也可以接收BottomAppBar(),配合floatingActionButton()实现底部导航栏中间大按钮的特殊页面
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//              icon: Icon(Icons.home),
//              title: Text('Home'),
//              activeIcon: Icon(
//                Icons.home,
//                color: Colors.blue,
//              )),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.business),
//              title: Text('Business'),
//              activeIcon: Icon(
//                Icons.business,
//                color: Colors.blue,
//              )),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.school),
//              title: Text('School'),
//              activeIcon: Icon(
//                Icons.school,
//                color: Colors.blue,
//              )),
//        ],
//        currentIndex: _currentIndex,
//        onTap: (index) {
//          setState(() {
//            _currentIndex = index;
//          });
//        },
//      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text('新闻'),
          Text('老师'),
          Text('公务员'),
        ],
      ),
    );
  }
}
