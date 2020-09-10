# flutter-basic
flutter-basic创建于2020/08/23
## 基本命令

>
   `
   flutter create 项目名称
   flutter run
   flutter run -d 设备名称
   `

## 插件包地址 pub.dev

   [pub.dev](http://www.pub.dev)
    
## 常用组件，详细见代码

### StatelessWidget

>
   + 1.Container
   + 2.Text
   + 3.CloseButton
   + 4.BackButton
   + 5.Chip
   + 6.Divider
   + 7.Card
   + 8.AlertDialog
   + 9.Column
   + 10.Icon
   
   
## StatefulWidget

>
   + 1.MaterialApp
   + 2.Scaffold
   + 3.BottomNavigationBar
   + 4.BottomNavigationBarItem
   + 5.FloatingActionButton
   + 6.TextField
   + 7.PageView
   + 8.Image
   
## 布局组件

> 
   + 1.Column
   + 2.Row
   + 3.ClipOval、ClipRect(裁剪)
   + 4.FractionallySizedBox
   + 5.Stack
   + 6.Wrap
   + 7.Expanded
   
   
## 手势


>
   + 1.GestureDetector
   
   
## 问题


>
     Starting a Gradle Daemon, 5 busy and 1 incompatible and 1 stopped Daemons could not be reused, use --status for details
     
   
   [解决](https://segmentfault.com/a/1190000022604574?utm_source=tag-newest)
   `cordova clean`
   

## google 字体库

[地址](http://www.googlefonts.net/)


## `widget`合集

+ 1. `ListTile`

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础组件-ListTitle
///一个固定高度呢行，通常包含标题、副标题、行前图标、行后图标
class ListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件-ListTitle'),
        leading: BackButton(),
      ),
      body: Container(
        child: ListTile(
          ///最左侧的头部，参数是一个widget
          leading: Icon(Icons.cake,),
          ///标题,参数widget
          title: Text('标题'),
            ///副标题，widget
          subtitle: Row(
            children: <Widget>[
              Text('副标题'),
              Icon(Icons.person),
          ],
        ),
          ///展示在title后面的后置组件 widget
          trailing: Icon(Icons.save),
          ///点击事件
          onTap: ()=> print('点击事件'),
          onLongPress: ()=> print('长按'),
          ///默认是false,是否默认三行高度，subtitle不为空是才能使用 bool
          isThreeLine: true,
          ///bool，让List tiles 有更小的高度
          dense: true,
          ///默认为true ,是否能被点击
          enabled: true,
          ///默认值为false，是否默认被选中,呈现当前的主题颜色
          selected: true,
        ),
      ),
    );
  }
}

```

+ 2. `ListView`

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter 基础组件-listView
///可以沿水平、垂直方向滚动的列表组件
///在已知有限个列表项的情况下采用默认构造函数（传入list children）
///长列表是采用build模式，能提高性能。不是把所有子控件都构造出来，而是在控件viewport加上头尾的cacheExtent这个范围内的子Item才会被构造。在构造时传递一个builder，按需加载是一个惯用模式，能提高加载性能
///separated 列表中需要分割线时，可以自定义复杂的分割线
///custom 需要自定义SliverChildDelegate
// ignore: must_be_immutable
class ListViewWidget extends StatefulWidget {
  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  ///滚动控制 _表示私有属性
  ///会为每一个可滚动组件创建一个ScrollPosition对象，这些ScrollPosition保存在ScrollController的positions属性中（List<ScrollPosition>
  ScrollController _scrollController = ScrollController();

  ///是否显示“返回到顶部”按钮
  bool showTopBtn = false;

  ///滚动进度百分比
  String _progress = '0%';

  @override
  void initState() {
    //监听滚动事件，打印滚动位置
    _scrollController.addListener(() {
      print('滚动的位置：${_scrollController.offset}');
      if (_scrollController.offset >= 500 && !showTopBtn) {
        setState(() {
          showTopBtn = true;
        });
      } else if (_scrollController.offset < 500 && showTopBtn) {
        setState(() {
          showTopBtn = false;
        });
      }
      print(showTopBtn);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件-listView'),
        leading: BackButton(),
      ),

      ///悬浮按钮
      floatingActionButton: !showTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                ///返回底部的时候执行动画
                _scrollController.animateTo(.0,
                    duration: Duration(milliseconds: 600), curve: Curves.ease);
              },
            ),

      ///进度条
      body: Scrollbar(
        ///监听滚动通知
        child: NotificationListener<ScrollNotification>(
          // ignore: missing_return
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;

            ///重新构建
            setState(() {
              _progress = '${(progress * 100).toInt()}%';
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            //return true; //放开此行注释后，进度条将失效
          },
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ///构建ListView vertical 垂直方向 默认构造器
//              _buildListViewDefaultVertical(),
              /// horizontal 水平方向 默认构造器
//              _buildListViewDefaultHorizontal(),

              /// builder
//              _buildLitViewBuilder(),

              ///separated
              _buildListViewSeparated(),

              ///custom 无限列表
//              _buildListViewCustom(),
              ///显示进度百分比
              CircleAvatar(
                radius: 30.0,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///构建列表项
  _buildListItem(
      {Widget leading,
      String title,
      String subtitle,
      Widget trailing,
      isThreeLine = false,
      dense = true}) {
    return ListTile(
      leading: leading,
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
    );
  }

  _buildList() {
    List<Widget> widgets = [];
    for (var i = 0; i < 100; i++) {
      widgets.add(_buildListItem(
          leading: Icon(Icons.title),
          title: '主标题',
          subtitle: '副标题',
          trailing: Icon(Icons.save)));
    }
    return widgets;
  }

  ///避免内存泄漏，需要调用释放资源
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  _buildListViewDefaultVertical() {
    return ListView(
      ///列表的滚动方向，默认值为Axis.vertical 垂直方向
      scrollDirection: Axis.vertical,

      ///指定Item在滑动方向上的高度，用来提高滑动性能 double
      ///越小性能越好
      ///列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
      itemExtent: 40.0,

      ///EdgeInsetsGeometry是一个抽象类，一般使用其子类EdgeInsets
      /*
        EdgeInsets：
          1. fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的补白
          2. all(double value) : 所有方向均使用相同数值的补白
          3. only({left, top, right ,bottom })：可以设置具体某个方向的补白(可以同时指定多个方向)
          4. symmetric({ vertical, horizontal })：用于设置对称方向的补白，vertical指top和bottom，horizontal指left和right
         */
      padding: EdgeInsets.all(20),

      ///决定滚动方向是否与阅读方向一致, 默认值为false。滚动方向是否与阅读方向一致
      reverse: false,

      /*
        ScrollController:
          1.构造函数参数：initialScrollOffset（初始滚动位置）、keepScrollOffset（是否保存滚动位置）
          2.offset（可滚动组件当前的滚动位置）
          3.jumpTo(double offset)、animateTo(double offset,...)：这两个方法用于跳转到指定的位置，它们不同之处在于，后者在跳转时会执行一个动画，而前者不会
          4.滚动监听 controller.addListener(()=>print(controller.offset))
         */
      controller: _scrollController,

      ///列表项
      children: _buildList(),
    );
  }

  ///默认构造器水平列表
  _buildListViewDefaultHorizontal() {
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          _buildListItemHorizontal(180.0, 200.0, Colors.red),
          _buildListItemHorizontal(180.0, 200.0, Colors.blue),
          _buildListItemHorizontal(180.0, 200.0, Colors.orange),
          _buildListItemHorizontal(180.0, 200.0, Colors.white10),
        ],
      ),
    );
  }

  _buildListItemHorizontal(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }

  _buildLitViewBuilder() {
    return ListView.builder(
      itemBuilder: (context, index) => _buildRow(index),
      itemCount: 302,
      itemExtent: 20.0,

      ///内间距
      padding: EdgeInsets.all(60.0),

      /// 如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
      primary: true,

      ///内容适配
      shrinkWrap: true,
      /*
      shrinkWrap特别推荐child 高度会适配 item填充的内容的高度,我们非常的不希望child的高度固定，因为这样的话，如果里面的内容超出就会造成布局的溢出。
      shrinkWrap多用于嵌套listView中 内容大小不确定 比如 垂直布局中 先后放入文字 listView （需要Expend包裹否则无法显示无穷大高度 但是需要确定listview高度 shrinkWrap使用内容适配不会有这样的影响）

        在构造中默认是false 它的意思就是为主的意思，primary为true时，我们的controller 滑动监听就不能使用了

     physics这个属性几个滑动的选择
      AlwaysScrollableScrollPhysics() 总是可以滑动
      NeverScrollableScrollPhysics禁止滚动
      BouncingScrollPhysics 内容超过一屏 上拉有回弹效果
      ClampingScrollPhysics 包裹内容 不会有回弹

      cacheExtent
      这个属性的意思就是预加载的区域
      设置预加载的区域 cacheExtent 强制设置为了 0.0，从而关闭了“预加载”

      controller
      滑动监听，我们多用于上拉加载更多，通过监听滑动的距离来执行操作。
       */
    );
  }

  _buildRow(int index) {
    TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.blue);

    ///奇数
    if (index.isOdd) {
      return Divider(
        color: Colors.grey,
        height: 20,
      );
    } else {
      return Text(
        '$index',
        textAlign: TextAlign.center,
        style: textStyle,
      );
    }
  }

  _buildListViewSeparated() {
    return Column(
      children: <Widget>[
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36), color: Colors.red),
        ),
        /*
          在弹性布局中，可以使用Expanded自动拉伸组件大小，并且我们也说过Column是继承自Flex的，所以我们可以直接使用Column+Expanded来实现
         */
        Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => Text(
                    '$index',
                    textAlign: TextAlign.center,
                  ),
              separatorBuilder: (context, index) => Divider(
                    color: Colors.green,
                    height: 20,
                  ),
              itemCount: 100),
        ),
      ],
    );
  }

  _buildListViewCustom() {
    return ListView.custom(
      itemExtent: 40.0,
      childrenDelegate: MyChildrenDelegate((context, index) {
        return Container(
          child: Text('custom'),
        );
      }),
    );
  }
}

/*
    继承SliverChildBuilderDelegate  可以对列表的监听
 */
class MyChildrenDelegate extends SliverChildBuilderDelegate {
  MyChildrenDelegate(
    Widget Function(BuildContext, int) builder, {
    int childCount,
    bool addAutomaticKeepAlive = true,
    bool addRepaintBoundaries = true,
  }) : super(builder,
            childCount: childCount,
            addAutomaticKeepAlives: addAutomaticKeepAlive,
            addRepaintBoundaries: addRepaintBoundaries);

  ///监听 在可见的列表中 显示的第一个位置和最后一个位置
  @override
  void didFinishLayout(int firstIndex, int lastIndex) {
    print('firstIndex: $firstIndex, lastIndex: $lastIndex');
  }

  ///可不重写 重写不能为null  默认是true  添加进来的实例与之前的实例是否相同 相同返回true 反之false
  ///listView 暂时没有看到应用场景 源码中使用在 SliverFillViewport 中
  @override
  bool shouldRebuild(SliverChildBuilderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    print("oldDelegate$oldDelegate");
    return super.shouldRebuild(oldDelegate);
  }
}

```

++ 3. 其他详细看代码 widgets 文件夹中


