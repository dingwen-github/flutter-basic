import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 页面生命周期

/*
    + 1.初始化时期`createState initSate`
    + 2.更新时期`didChangeDependencies build didUpdateWidget`
    + 3.销毁时期`deactivate dispose`
 */
class FlutterWidgetLifeCycle extends StatefulWidget {
  //当我们创建一个新的StatefulWidget时会立即调用createState(),createState必须被重写
  @override
  _FlutterWidgetLifeCycleState createState() => _FlutterWidgetLifeCycleState();
}

class _FlutterWidgetLifeCycleState extends State<FlutterWidgetLifeCycle> {
  int _count = 0;

  //创建widget时调用的出了构造方法外的第一个方法，在这个方法中通常做一些初始化的工作，比如chanel的初始化，监听器的初始化等等
  @override
  void initState() {
    print('initState');
    super.initState();
  }

/*
  当依赖的State对象改变时调用
  a.在第一次构建widget时，在initState()之后会立刻调用此方法
  b.如果StatefulWidget依赖于InheritedWidget,那么当前State所依赖的InheritedWidget中的变量改变的时候会再次调用它

  InheritedWidget： 高效的数据共享
   */
  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  /*
    这是一个必须实现的方法，在这里实现你要呈现的页面内容
    它会在didChangeDependencies()之后立即调用
    当调用setState后也会再次调用该方法
   */
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 页面生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
              child: Text(
                '点我',
                style: TextStyle(fontSize: 26),
              ),
            ),
            Text(_count.toString()),
          ],
        ),
      ),
    );
  }

  /*
    这是一个不常用到的生命周期方法，当父组件需要重绘时才会调用
    该方法携带一个oldWidget参数，可以进行对比实现一些额外的逻辑
   */
  @override
  void didUpdateWidget(FlutterWidgetLifeCycle oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }


/*
  很少使用，在组件被移除的时候调用，在dispose之前调用
 */
  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  /*
    常用,组件被销毁的时候调用
    通常在该方法中执行一些资源的释放工作，监听器拦截，chanel的销毁等等
   */
  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }
}
