import 'package:flutter/material.dart';
///Flutter listView 基础

const CITY_NAMES = [ '北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州', '洛阳', '厦门', '青岛', '拉萨' ];
class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Demo'),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildList(),
      ),
    );
  }

  _buildList() {
    return CITY_NAMES.map((city)=> _item(city)).toList();
  }

  Widget _item(String city){
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white,fontSize: 20),
      ),
    );
  }
}
