import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///Flutter widget 生命周期
///StatelessWidget 的生命周期 build
///build 是用来创建 Widget 的，但因为 build 在每次界面刷新的时候都会调用，所以不要在 build 里写业务逻辑，可以把业务逻辑写到你的 StatelessWidget 的构造函数里

///StatefulWidget 的生命周期

///createState
///createState 是 StatefulWidget 里创建 State 的方法，当要创建新的 StatefulWidget 的时候，会立即执行 createState，而且只执行一次，createState 必须要实现

///initState
///initState 是 StatefulWidget 创建完后调用的第一个方法，而且只执行一次 可以在 initState 里做一些初始化的操作

///didChangeDependencies
///当 StatefulWidget 第一次创建的时候，didChangeDependencies 方法会在 initState 方法之后立即调用，之后当 StatefulWidget 刷新的时候，就不会调用了，
///除非你的 StatefulWidget 依赖的 InheritedWidget(数据共享))发生变化之后，didChangeDependencies 才会调用，所以 didChangeDependencies 有可能会被调用多次

///build
///在 StatefulWidget 第一次创建的时候，build 方法会在 didChangeDependencies 方法之后立即调用，另外一种会调用 build 方法的场景是，每当 UI 需要重新渲染的时候，build
///都会被调用，所以 build 会被多次调用，然后 返回要渲染的 Widget。千万不要在 build 里做除了创建 Widget 之外的操作，因为这个会影响 UI 的渲染效率

///addPostFrameCallback
///addPostFrameCallback 是 StatefulWidget 渲染结束的回调，只会被调用一次，之后 StatefulWidget 需要刷新 UI 也不会被调用，addPostFrameCallback 的使用方法是在 initState 里添加回调

///didUpdateWidget
///didUpdateWidget 这个生命周期我们一般不会用到，只有在使用 key 对 Widget 进行复用的时候才会调用

///deactivate
///当要将 State 对象从渲染树中移除的时候，就会调用 deactivate 生命周期，这标志着 StatefulWidget 将要销毁，但是有时候 State 不会被销毁，而是重新插入到渲染树中

///dispose
///当 View 不需要再显示，从渲染树中移除的时候，State 就会永久的从渲染树中移除，就会调用 dispose 生命周期，这时候就可以在 dispose 里做一些取消监听、动画的操作，和 initState 是相反的
class WidgetLifecycle extends StatefulWidget {
  @override
  _WidgetLifecycleState createState() {
    print('widget第一个生命周期函数： createState()');
    return _WidgetLifecycleState();
  }
}

class _WidgetLifecycleState extends State<WidgetLifecycle> {
  @override
  void initState() {
    super.initState();
    print('widget第二个生命周期函数： initState()');
    SchedulerBinding.instance.addPostFrameCallback(
        (_) => print('widget第五个生命周期函数： addPostFrameCallback()'));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('widget第三个生命周期函数： didChangeDependencies()');
  }

  @override
  Widget build(BuildContext context) {
    print('widget第四个生命周期函数： build()');
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Lifecycle'),
        leading: BackButton(),
      ),
      body: Center(
        child: Text('Lifecycle'),
      ),
    );
  }

  @override
  void didUpdateWidget(WidgetLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('widget第六个生命周期函数： didUpdateWidget()');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('widget第七个生命周期函数： deactivate()');
  }

  @override
  void dispose() {
    super.dispose();
    print('widget第八个生命周期函数： dispose()');
  }
}
