import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础- Drawer
class ScaffoldDrawerWidget extends StatefulWidget {
  @override
  _ScaffoldDrawerWidgetState createState() => _ScaffoldDrawerWidgetState();
}

class _ScaffoldDrawerWidgetState extends State<ScaffoldDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),

      ///左边侧栏
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: 150,
              child: UserAccountsDrawerHeader(
                ///设置用户名
                accountName: Text('Drawer'),

                ///设置用户邮箱
                accountEmail: Text('dingwen@qq.com'),

                ///当前用户头像
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/admin.jpg'),
                ),

                ///回调事件
                ///当accountName或accountEmail被点击的时候所触发的回调函数，可以用来显示其他额外的信息
                onDetailsPressed: () {},
              ),
            ),
            ListTile(
              leading: Icon(Icons.wifi),
              title: new Text('无线网络1'),
              subtitle: new Text('我是副标题'),
            ),
            ListTile(
              leading: Icon(Icons.wifi),
              title: new Text('无线网络2'),
              subtitle: new Text('我是副标题'),
            ),
            ListTile(
              leading: Icon(Icons.wifi),
              title: new Text('无线网络3'),
              subtitle: new Text('我是副标题'),
              onTap: (){
                print('ssss');
              },
            ),
            ListTile(
              leading: Icon(Icons.wifi),
              title: new Text('无线网络4'),
              subtitle: new Text('我是副标题'),
            ),
          ],
        ),
      ),

      ///右边侧栏
      endDrawer: Drawer(),
    );
  }
}
