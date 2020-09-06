import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 应用生命周期,WidgetsBindingObserver:是一个Widgets绑定观察器，通过它我们可以监听应用的生命周期

class AppLifecycle extends StatefulWidget {
  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver{

  @override
  void initState() {
    //将当前类添加到监听器里面去
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 应用生命周期'),
        leading: BackButton(),
      ),
      body: Center(
        child: Text('123'),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state=$state');
    if(state == AppLifecycleState.paused){
      print('App进入后台');
    }else if(state == AppLifecycleState.resumed){
      print('App进入前台');
    }else if(state == AppLifecycleState.inactive){
      //不常用，应用程序处于非活动状态，并且未接收用户输入时调用，比如来了一个电话
    }else if(state == AppLifecycleState.detached){
      //不常用 没有视图的状态
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
