import 'package:flutter/material.dart';
class HomeTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeContent();
  }
}

class HomeContent extends State {
  List _tabList = [
    "Flutter",
    "Android",
    "Java",
    "Python",
    "C++",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: _tabList.length,
      child: Scaffold(
          appBar: AppBar(
            leading: Builder(builder: (BuildContext context) {
              // 自定义leading属性，打开侧边栏
              return IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // 点击打开侧边栏
                    Scaffold.of(context).openDrawer();
                  });
            }),
            title: _getTabBar(),
          ),
          body: TabBarView(children: [
            _getTabContent(0),
            _getTabContent(1),
            _getTabContent(2),
            _getTabContent(3),
            _getTabContent(4),
          ]),
          drawer: Drawer()),
    );
  }

  /**
   *设置TabBar
   * */
  Widget _getTabBar() {
    return TabBar(
      isScrollable: true,
      labelColor: Colors.deepPurple,
      // 选中时Tab 字体颜色
      unselectedLabelColor: Colors.white,
      // 未选中时Tab 字体颜
      indicatorWeight: 1.5,
      // 指示器的高度
      indicatorPadding: EdgeInsets.only(bottom: 6),
      //指示器距离底部的距离  默认时0

      labelStyle: TextStyle(
        // 选中时Tab字体大小
        fontSize: 18.0,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 15.0,
      ),
      indicatorColor: Colors.deepPurple,
      //指示器颜色
      indicatorSize: TabBarIndicatorSize.label,
      //设置 indicator的长度等于tab标题的长度

      tabs: [
        _getTabTitle(0),
        _getTabTitle(1),
        _getTabTitle(2),
        _getTabTitle(3),
        _getTabTitle(4),
      ],
    );
  }

  /**
   *设置Tab的Title
   * */
  Widget _getTabTitle(int index) {
    return Tab(
      text: this._tabList[index],
    );
  }

  Widget _getTabContent(int index) {
    return Center(
      child: Text(this._tabList[index]),
    );
  }
}
