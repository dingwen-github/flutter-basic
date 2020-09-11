import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

///Flutter 基础-Text
class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
        leading: BackButton(),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'talk is cheap show me the code，丁文，Flutter基础组件Text,2020年9月11日，下午13点59分，晴',

              ///文本的对齐方式；可以选择左对齐、右对齐还是居中
              //左对齐 默认
              textAlign: TextAlign.left,
              //右对齐
//          textAlign: TextAlign.right,
              //居中
//          textAlign: TextAlign.center,
              ///文本方向
              //left to right
//          textDirection: TextDirection.ltr
              //right to left
              textDirection: TextDirection.rtl,

              ///是否自动换行 false文字不考虑容器大小  单行显示   超出；屏幕部分将默认截断处理
              softWrap: true,

              ///指定文本显示的最大行数，默认情况下，文本是自动折行的
              ///如果有多余的文本，可以通过overflow来指定截断方式，默认是直接截断
              maxLines: 1,

              ///TextOverflow.clip剪裁   TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
              overflow: TextOverflow.ellipsis,

              ///代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性
              textScaleFactor: 2.0,

              style: TextStyle(
                ///文字颜色
                color: Colors.deepOrange,

                ///该属性和Text的textScaleFactor都用于控制字体大小
                ///fontSize可以精确指定字体大小，而textScaleFactor只能通过缩放比例来控制。
                fontSize: 20.0,

                ///该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height
                //相当于文字高度的三倍
                height: 3.0,

                ///指定字体
                fontFamily: 'Courier',

                ///背景颜色
                backgroundColor: Colors.yellow,

                ///线的颜色
                decorationColor: Colors.green,

                ///装饰线
                /// none无文字装饰   lineThrough删除线   overLine文字上面显示线    underline文字下面显示线
                decoration: TextDecoration.lineThrough,

                ///文字装饰的风格 文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)  double两条线  solid 1条线
                decorationStyle: TextDecorationStyle.dashed,

                ///单词间隙(负值可以让单词更紧凑)
                wordSpacing: -2,

                ///文字样式，斜体和正常、
                fontStyle: FontStyle.italic,

                ///字体粗细，加粗和正常
                fontWeight: FontWeight.w900,
              ),
            ),
            Text.rich(TextSpan(
              text: 'TextSpan',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0,
                  decoration: TextDecoration.none),
              children: <TextSpan>[
                TextSpan(
                  text: 'Flutter',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: 'Dart',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 30.0,
                  ),
                  recognizer: TapGestureRecognizer()..onTap =()=> print('点我'),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
