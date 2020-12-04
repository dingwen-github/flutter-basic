import 'package:flutter/material.dart';
/// 底部弹出表单的封装
/// dingwen
/// 2020/12/4
class AlertBottomForm extends StatefulWidget {
  List<Tab> tabs = [];
  List<Widget> childes = [];
  AlertBottomForm({this.tabs,this.childes});
  @override
  _AlertBottomFormState createState() => _AlertBottomFormState();
}

class _AlertBottomFormState extends State<AlertBottomForm> with SingleTickerProviderStateMixin {

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: widget.tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          _buildTabBar(),
          Container(
              width: MediaQuery.of(context).size.width,
              height:
              MediaQuery.of(context).size.height / 3,
              child: _buildTableBarView())
        ],
      ),
    );
  }

  ///构建TabBar
  TabBar _buildTabBar() {
    return TabBar(
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 16),
      isScrollable: true,
      labelColor: Colors.blue,
      indicatorWeight: 2,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.orangeAccent,
      controller: _tabController,
      tabs: widget.tabs,
    );
  }

  ///构建TabBarView
  TabBarView _buildTableBarView() {
    return TabBarView(
      controller: _tabController,
      children: widget.childes,
    );
  }
}
