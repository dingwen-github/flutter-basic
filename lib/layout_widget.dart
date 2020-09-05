import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///布局
class LayoutWidget extends StatefulWidget {
  @override
  _LayoutWidgetState createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '布局组件',
      theme: ThemeData(
        //主题颜色
        primarySwatch: Colors.red,
      ),
      //整个页面
      home: Scaffold(
        appBar: AppBar(
          title: Text('布局组件'),
          //左边返回按钮
          //GestureDetector 手势

          leading: GestureDetector(
            onTap: (){
              //退出当前路由
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
//        body: Container(
//          //容器布局组件,不能使用MediaQuery
//          width: 600,
//          height: 800,
//          color: Colors.black54,
//          child: SingleChildScrollView(
//            child: Column(
//              children: <Widget>[
//                Text('垂直布局'),
//                Text('垂直布局'),
//                Row(
//                  children: <Widget>[
//                    Text('水平布局'),
//                    Text('水平布局'),
//                    //裁剪成圆形,根据图片宽度高度，可设置相对于大小。截出来的形状有所差异
//                    ClipOval(
//                      //SizedBox可设置大小
//                      child: SizedBox(
//                        width: 200,
//                        height: 200,
//                        child: Image.network(
//                            'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2915815734,3162313627&fm=26&gp=0.jpg'),
//                      ),
//                    ),
//                  ],
//                ),
//                Padding(
//                  padding: EdgeInsets.all(10),
//                  //裁剪成正方形
//                  child: ClipRect(
//                    //圆角
//                    child: Image.network(
//                      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2915815734,3162313627&fm=26&gp=0.jpg',
//                      width: 200,
//                      height: 200,
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.all(10),
//                  //裁剪为矩形
//                  child: ClipRRect(
//                    //圆角
//                    //Radius.circular四个角
//                    borderRadius: BorderRadius.all(Radius.circular(10)),
//                    //设置透明度
//                    child: Opacity(
//                      //60%透明度
//                      opacity: 0.6,
//                      child: Image.network(
//                        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2915815734,3162313627&fm=26&gp=0.jpg',
//                        width: 200,
//                        height: 200,
//                      ),
//                    ),
//                  ),
//                ),
//                Container(
//                  width: 300,
//                  height: 100,
//                  color: Colors.transparent,
//                  margin: EdgeInsets.all(10),
//                  //将PageView裁剪成圆角
//                  child: PhysicalModel(
//                    //透明色
//                    color: Colors.transparent,
//                    borderRadius: BorderRadius.all(Radius.circular(20)),
//                    //裁剪的行为
//                    //抗锯齿
//                    clipBehavior: Clip.antiAlias,
//                    child: PageView(
//                      children: <Widget>[
//                        _item('第一页', Colors.orange),
//                        _item('第二页', Colors.blue),
//                        _item('第三页', Colors.deepOrangeAccent),
//                      ],
//                    ),
//                  ),
//                ),
//                //撑满宽度
//                Column(
//                  children: <Widget>[
//                    FractionallySizedBox(
//                      //撑满整个屏幕宽度
//                      widthFactor: 1,
//                      child: Container(
//                        //装饰器
//                        decoration: BoxDecoration(color: Colors.deepPurple),
//                        child: Text('宽度撑满'),
//                      ),
//                    ),
//                  ],
//                ),
//                //元素叠加，层叠布局
//                Stack(
//                  children: <Widget>[
//                    Image.network(
//                      'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2915815734,3162313627&fm=26&gp=0.jpg',
//                      width: 200,
//                      height: 200,
//                    ),
//                    Positioned(
//                      //左下方
//                      left: 0,
//                      bottom: 0,
//                      child: Image.network(
//                        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2915815734,3162313627&fm=26&gp=0.jpg',
//                        width: 50,
//                        height: 50,
//                      ),
//                    )
//                  ],
//                ),
//                //从左到右布局，可以换行
//                Wrap(
//                  //水平间距
//                  spacing: 10,
//                  runSpacing: 6,
//                  children: <Widget>[
//                    _chip('Flutter'),
//                    _chip('Java'),
//                    _chip('SpringBoot'),
//                    _chip('mybatis-plus'),
//                    _chip('Spring'),
//                  ],
//                  //垂直间距
//                ),
//              ],
//            ),
//          ),
//        ),
      body: Column(
        children: <Widget>[
          Text('expand'),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('拉伸填满高度'),
            ),
          ),
        ],
      ),
      ),
    );
  }

  Widget _item(title, color) {
    TextStyle textStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown);
    return Container(
      width: 300,
      height: 100,
      color: color,
      child: Center(
        child: Text(
          title,
          style: textStyle,
        ),
      ),
    );
  }

  _chip(String label) {
    return Chip(
      label: Text(label),
      //左边图标
      //CircleAvatar 圆形
      avatar: CircleAvatar(
        backgroundColor: Colors.deepPurple,
        child: Text(
          label.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
