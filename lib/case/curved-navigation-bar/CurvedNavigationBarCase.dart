import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_basic/widgets/animated_container_widget.dart';
import 'package:flutter_basic/widgets/custom_painter_widget.dart';
import 'package:flutter_basic/widgets/draggable_widget.dart';
import 'package:flutter_basic/widgets/limited_box_widget.dart';
import 'package:flutter_basic/widgets/list_view_widget.dart';

/// curved navigation bar case
/// @author: dingwen
/// @date: 2021/1/7

class CurvedNavigationBarCase extends StatefulWidget {
  @override
  _CurvedNavigationBarCaseState createState() =>
      _CurvedNavigationBarCaseState();
}

class _CurvedNavigationBarCaseState extends State<CurvedNavigationBarCase> {
  int _index = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  List<Widget> _pageList = [];
  List<IconData> _iconDataList = [];
  double _size = 30;
  MaterialColor _inactiveColor = Colors.grey;
  MaterialColor _activeColor = Colors.deepOrange;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageList.addAll([
      AnimatedContainerWidget(),
      DraggableWidget(),
      CustomPainterWidget(),
      LimitedBoxWidget(),
      ListViewWidget(),
    ]);
    _iconDataList.addAll([
      Icons.home,
      Icons.widgets,
      Icons.turned_in,
      Icons.toys,
      Icons.person,
    ]);
   _pageController = PageController(initialPage: _index,keepPage: true);///缓存页面
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: _buildIconList(),
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.grey[200],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _index = index;
              _pageController.animateToPage(index, duration: Duration(milliseconds: 600), curve: Curves.easeInOut);
            });
          },
          letIndexChange: (index) => true,
        ),
        body: PageView.builder(
            physics: NeverScrollableScrollPhysics(), //禁止滑动
            controller: _pageController,
            itemCount: _pageList.length,
            onPageChanged: (index) => setState((){
              _bottomNavigationKey.currentState.build(context);
                _index = index;
            }),
            itemBuilder: (context,index)=> _pageList[index]));
  }

  List<Widget> _buildIconList() {
    List<Widget> _iconList = [];
    for (int i = 0; i < _iconDataList.length; i++) {
      _iconList.add(Tooltip(
        message: 'test',
        child: Column(children: [
          Icon(_iconDataList[i],
              size: _size, color: _index == i ? _activeColor : _inactiveColor),
          Text('首页',style: TextStyle(fontSize: 8,color:  _index == i ? _activeColor : _inactiveColor),)
        ],),
      ));
    }
    return _iconList;
  }
}
