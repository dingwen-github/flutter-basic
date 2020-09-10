import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础-BottomAppBar
class ScaffoldBottomAppBar extends StatefulWidget {
  @override
  _ScaffoldBottomAppBarState createState() => _ScaffoldBottomAppBarState();
}

class _ScaffoldBottomAppBarState extends State<ScaffoldBottomAppBar> {
  List<Widget> _viewList = [];
  int _index = 0;

  @override
  void initState() {
    ///初始化视图
    _viewList..add(EachView('HOME'))..add(EachView('CLOCK'));
    super.initState();
  }

  _openNewPage(){
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return EachView('new page');
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewPage,
        child: Icon(Icons.add,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ///和底栏进行融合
      bottomNavigationBar: BottomAppBar(
        ///底部工具栏颜色
        color: Colors.blue,
        ///设置底栏的形状，一般使用这个都是为了和floatingActionButton融合，
        /// 所以使用的值都是CircularNotchedRectangle(),有缺口的圆形矩形。
        shape: CircularNotchedRectangle(),
        child: Row(
          ///里边可以放置大部分Widget，让我们随心所欲的设计底栏
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              onPressed: (){
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.alarm,
                color: Colors.white,
              ),
              onPressed: (){
                setState(() {
                  _index = 1;
                });
              },
            ),
          ],
        ),
      ),
      body: _viewList[_index],
//      persistentFooterButtons: <Widget>[
//        Text('123')
//      ],
    );
  }
}

// ignore: must_be_immutable
class EachView extends StatefulWidget {
  String _title;

  EachView(this._title);

  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Center(
        child: Text(widget._title),
      ),
    );
  }
}
