import 'package:flutter/material.dart';

///Flutter 基础 下拉刷新与上拉加载实例
List<String> cityNames = [
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

class PullDropDemo extends StatefulWidget {
  @override
  _PullDropDemoState createState() => _PullDropDemoState();
}

class _PullDropDemoState extends State<PullDropDemo> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新与上拉加载更多功能实现'),
        leading: BackButton(),
      ),
      body: RefreshIndicator(
        onRefresh: _handlerRefresh,
        child: ListView(
          controller: _scrollController,
          children: _buildList(),
        ),
      ),
    );
  }

  Future<Null> _handlerRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
    return null;
  }

  _buildList() {
    return cityNames.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  void _loadData() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      List<String> list = List<String>.from(cityNames);
      list.addAll(cityNames);
      cityNames = list;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}
