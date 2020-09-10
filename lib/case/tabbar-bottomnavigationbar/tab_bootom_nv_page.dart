import 'package:flutter/material.dart';

import 'home_tab_page.dart';
import 'me_content.dart';
import 'me_tab_page.dart';

class TabBootomNvPage extends StatefulWidget {
  int index;

  TabBootomNvPage({this.index}) {
    if (index == null) {
      index = 0;
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BootomNvPage(currentIndex: this.index);
  }
}

class BootomNvPage extends State {
  int currentIndex = 0;

  BootomNvPage({this.currentIndex});

  List _mList = [
    HomeTabPage(),
    MeTabPage(),
    SetTabPage(),
  ];

  List _titleList = ["首页", "计算器", "路由"];

  List _mIcons = [
//    IconButton(icon:currentIndex==0?Image.asset("home_select.png"):Image.asset("home_unselect.png"), onPressed: null),
    Icon(Icons.mail),
    Icon(Icons.settings),
//    Icon(Icons.video_call),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: this._mList[this.currentIndex],
      bottomNavigationBar: _getBottomNavigationBar(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(top: 20),
        width: 55,
        height: 55,
        child: _getFloatingActionButton(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _getFloatingActionButton() {
    return FloatingActionButton(
        foregroundColor: Colors.red,
        backgroundColor: currentIndex == 1 ? Color(0xff46CAD0) : Colors.blue,
        //点击时按钮的阴影效果
        highlightElevation: 0,
        elevation: 0,
        child: IconButton(
            icon: Image.asset(
          "images/tax_unselect.png",
          color: Colors.white,
          width: 20,
          height: 20,
        )),
        onPressed: () {
          setState(() {
            this.currentIndex = 1;
          });
        });
  }

  BottomNavigationBar _getBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Color(0xff46CAD0),
      // item 选中时的颜色   不设置selectedIconTheme属性  就默认跟字体一个颜色
      unselectedItemColor: Colors.black,
      // item 未选中时的颜色   不设置unselectedIconTheme属性  就默认跟字体一个颜色

      selectedFontSize: 14,
      // 选中时字体大小
      unselectedFontSize: 14,
      // 未选中时字体大小

      iconSize: 10,
      // item图标大小

      selectedLabelStyle: TextStyle(fontSize: 14),
      // 选中时字体style
      unselectedLabelStyle: TextStyle(fontSize: 14),
      // 未选中时字体style

//      unselectedIconTheme: IconThemeData(color: Colors.amber),
//      设置未选中时icon的颜色
//      selectedIconTheme: IconThemeData(color: Color(0xff46CAD0)),
      //设置选中时icon的颜色

//        showSelectedLabels: false, // 选中时不显示BottomNavigationBarItem的title
//        showUnselectedLabels: false,//未选中时不显示BottomNavigationBarItem的title

      type: BottomNavigationBarType.fixed,
      currentIndex: this.currentIndex,
      onTap: (index) {
        setState(() {
          this.currentIndex = index;
        });
      },
      items: [
        _getBottomNv_1(0),
        _getBottomNv_1(1),
        _getBottomNv_1(2),
      ],
    );
  }

  /**
   * 获取Tab的item
   * */
  BottomNavigationBarItem _getBottomNv(int index) {
    return new BottomNavigationBarItem(
      backgroundColor: Colors.amber,
      title: Text(_titleList[index]),
      icon: IconButton(
          icon: Container(
            width: 20,
            height: 20,
            child: currentIndex == 0
                ? Image.asset(
                    "images/home_select.png",
                  )
                : Image.asset("images/home_unselect.png"),
          ),
          onPressed: null),
    );
  }

  BottomNavigationBarItem _getBottomNv_1(int index) {
    return new BottomNavigationBarItem(
        backgroundColor: Colors.amber,
        title: Text(_titleList[index]),
        icon: _getIcon(index),
        activeIcon: _getActiveIcon(index));
  }

  Widget _getIcon(int index) {
    var image;

    switch (index) {
      case 0:
        image = new Image.asset(
          "images/home_unselect.png",
          width: 25,
          height: 25,
        );
        break;
      case 1:
        image = new Image.asset(
          "images/tax_unselect.png",
          width: 25,
          height: 25,
        );
        break;
      case 2:
        image = new Image.asset(
          "images/me_tab_unselect.png",
          width: 25,
          height: 25,
        );
        break;
    }
    return image;
  }

  Widget _getActiveIcon(int index) {
    var image;

    switch (index) {
      case 0:
        image = new Image.asset(
          "images/home_select.png",
          width: 25,
          height: 25,
        );
        break;
      case 1:
        image = new Image.asset(
          "images/tax_select.png",
          width: 25,
          height: 25,
        );
        break;
      case 2:
        image = new Image.asset(
          "images/me_tab_select.png",
          width: 25,
          height: 25,
        );
        break;
    }
    return image;
  }
}
