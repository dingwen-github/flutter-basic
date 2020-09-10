

import 'package:flutter/material.dart';

class ScaffoldBottomNavigationBarWidget extends StatefulWidget {
  ScaffoldBottomNavigationBarWidget({Key key}) : super(key: key);
  @override
  _ScaffoldBottomNavigationBarWidgetState createState() => _ScaffoldBottomNavigationBarWidgetState();
}

class _ScaffoldBottomNavigationBarWidgetState extends State<ScaffoldBottomNavigationBarWidget> {
  int _currentIndex = 0;
  List _pages = [
  ];

  @override
  void initState() {
    ///初始化pages
    _pages
      ..add(Text('Java'))
      ..add(Text('python'))
      ..add(Text('c'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter 标题'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        iconSize: 30.0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _buildBottomNavigationBarItem(Icon(Icons.home),'主页'),
          _buildBottomNavigationBarItem(Icon(Icons.category),'分类'),
          _buildBottomNavigationBarItem(Icon(Icons.my_location),'我的'),
        ],
      ),
    );
  }
  _buildBottomNavigationBarItem(Icon icon, String title) {
    return BottomNavigationBarItem(
        icon: icon,
        title: Text(title)
    );
  }
}
