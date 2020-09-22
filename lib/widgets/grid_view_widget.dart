import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础 GridView
const CITY_NAMES = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '洛阳',
  '厦门',
  '青岛',
  '拉萨'
];

class GridViewWidget extends StatefulWidget {
  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
        leading: BackButton(),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: _buildList(),
      ),
    );
  }

  _buildList() {
    return CITY_NAMES.map((city) => _buildItem(city)).toList();
  }

  Widget _buildItem(String city) {
    return Container(
      height: 80.0,
      margin: EdgeInsets.only(bottom: 5, right: 5),
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
