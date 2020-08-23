import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///StatelessWidget与基础组件

class StatefulGroupPage extends StatefulWidget {
  @override
  _StatefulGroupPageState createState() => _StatefulGroupPageState();
}

class _StatefulGroupPageState extends State<StatefulGroupPage> {
  int _currentIndex = 0;

  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 20);
    return MaterialApp(
      title: 'StatefulWidget与基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //整个页面
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatefulWidget与基础组件'),
        ),
        //底部导航栏
        bottomNavigationBar: BottomNavigationBar(
            //控制切换
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              //bottomNavigationBarItem至少要两项否则报错
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  //激活按钮
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  //必须要有标题
                  title: Text('主页')),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  color: Colors.grey,
                ),
                activeIcon: Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                title: Text('列表'),
              ),
            ]),
        //悬浮按钮
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        //RefreshIndicator刷新
        body: _currentIndex == 0 ? RefreshIndicator(child:ListView(
          children: <Widget>[
            Text('首页'),
            //输入框用法
            TextField(
              //输入文本的样式
              decoration: InputDecoration(
                //左上右下内容边距
                contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                //默认值
                hintText: '请输入',
                hintStyle: TextStyle(fontSize: 20),
              ),
            ),
            //PageView使用
            Container(
              height: 100,
              margin: EdgeInsets.only(top: 20),
              //装饰器
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent
              ),
              child: PageView(
                children: <Widget>[
                  _item('page1',Colors.deepOrange),
                  _item('page2',Colors.blue),
                  _item('page3',Colors.pink),
                  _item('page4',Colors.lightBlueAccent),
                ],
              ),
            ),
          ],
        ),
          //执行下拉刷新的回调
            onRefresh: _handleRefresh,
          //加载网络图片
        ) : Image.network('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png',width: 100,height: 100,),
      ),
    );
  }
}

 Widget _item(String title, Color color) {
  TextStyle textStyle = TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.bold);
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: color,
    ),
    child: Text(
      title,
      style: textStyle,
    ),
  );
}

Future<String> _handleRefresh() async{
  await Future.delayed(Duration(microseconds: 2000));
  return 'success';
}
