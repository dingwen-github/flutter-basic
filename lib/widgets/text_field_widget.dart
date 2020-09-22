import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter基础-TextFiled
///一个文本框默认情况下 可编辑 （允许输入文本的情况）获取焦点（正在输入文本）下，会有默认的一个下划线，这个下划线的颜色是获取的MaterialApp 组件中 them 配置的 textTheme 主题中的样式
class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  //用来控制TextField焦点的获取与关闭
  FocusNode _focusNode = FocusNode();

  //输入框是否可编辑
  bool isEnable = true;

  @override
  void initState() {
    ///添加获取焦点和失去焦点的监听
    _focusNode.addListener(() {
      //当前监听的TextField是否获取了输入焦点
      bool hasFocus = _focusNode.hasFocus;
      //当前focusNode是否添加了监听
      bool hasListeners = _focusNode.hasListeners;
      print('focusNode:监听$hasListeners 焦点： $hasFocus');
    });

    /// WidgetsBinding 它能监听到第一帧绘制完成，第一帧绘制完成标志着已经Build完成
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //获取输入框焦点
      FocusScope.of(context).requestFocus(_focusNode);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFiled'),
        leading: BackButton(),
        actions: <Widget>[
          FlatButton(
            child: Text('获取'),
            onPressed: () => FocusScope.of(context).requestFocus(_focusNode),
          ),
          FlatButton(
            child: Text('失去'),
            onPressed: () => _focusNode.unfocus(),
          ),
          FlatButton(
            child: Text('编辑'),
            onPressed: () {
              setState(() {
                isEnable = true;
              });
            },
          ),
          FlatButton(
            child: Text('不可编辑'),
            onPressed: () {
              setState(() {
                isEnable = false;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[

          ///这会创建一个基础TextField 默认带一个下划线
          TextField(),
          TextField(
            /**
             * TextCapitalization.sentences  这是最常见的大写化类型，每个句子的第一个字母被转换成大写。
             * TextCapitalization.characters  大写句子中的所有字符。
             * TextCapitalization.words 对每个单词首字母大写。
             */
            textCapitalization: TextCapitalization.sentences,
            //光标颜色
            cursorColor: Colors.red,
            //设置光标四个角的弧度
            cursorRadius: Radius.circular(20.0),
            //设置光标的宽度
            cursorWidth: 10.0,
            //设置键盘的类型
            keyboardType: TextInputType.phone,
            //设置键盘回车键的样式
            /**
             * none 为不弹出键盘
             * unspecified 换行
             * none 为不弹出键盘
             * done 完成或者done
             * go  前往或者go
             * search 搜索或者search
             * send  发送或者send
             * next 下一项或者next
             * previous
             * continueAction 继续或者 continue
             * join 加入或者join
             * route 路线或者route
             * emergencyCall 紧急电话
             * newline 换行或者newline
             */
            textInputAction: TextInputAction.go,
            //输入框是否可编辑
            enabled: true,
            //加密
//            obscureText: true,
            //设置此项会让TextField右下角有一个输入数量的统计字符串,
            maxLength: 60,
            //限制输入框里面的文本行数
            maxLines: 1,
            //输入文本框内的文本发生变化时候的回调
            onChanged: (changeVal) => print(changeVal),
            //键盘上按了done的回调
            onEditingComplete: () {
              print('onEditingComplete');
            },
            //自动获取焦点
            //可能出现异常信息，我们可以理解为当前页面还未绘制完的时候，我们就使用 TextField 来获取输入焦点了，然后负责焦点控制的程序找不到着力点，所以就出现了异常了
//            autofocus: true,
//            focusNode: _focusNode,
            style: TextStyle(
              //对其的水平线
              textBaseline: TextBaseline.alphabetic,
              //输入文字的颜色
              color: Colors.orange,
              //设置文字大小
              fontSize: 30.0,
              //Text线,输入文本的修饰线
              decoration: TextDecoration.lineThrough,
              //设置下划线的样式,输入文本的下划线
              //  TextDecorationStyle.dashed 设置为虚线
              //   TextDecorationStyle.solid 设置为实线
              //  TextDecorationStyle.double 两条实线
              //   TextDecorationStyle.wavy  波浪线
              decorationStyle: TextDecorationStyle.dashed,
              //设置文字粗体
              //400 等同于 normal，而 700 等同于 bold
              fontWeight: FontWeight.bold,
              //斜体或者正常
              fontStyle: FontStyle.italic,
              //单字间距
              letterSpacing: 2.0,
              //单词间距
              wordSpacing: 2.0,
              //控制行高 倍数（默认行高的倍数）乘以fontSize做为行高
              //相当于两倍的文字高度
              height: 2.0,
              //文本背景颜色
              backgroundColor: Colors.green,
//              shadows:
            ),
            //默认为left 可选值right center(start,end 与文字的方向有关)
            textAlign: TextAlign.start,
            //文字方向 right to left  or left to right
            textDirection: TextDirection.ltr,
          ),
          TextField(),
          Expanded(
            child: Container(

              ///SizedBox 用来限制一个固定 width height 的空间
              child: SizedBox(
                width: 400,
                height: 130,
                child: Container(
                  //距离顶部
                  margin: EdgeInsets.only(top: 60),
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment(0, 0),
                  child: TextField(
                    //是否可编辑
                    enabled: isEnable,
                    //焦点获取
                    focusNode: _focusNode,
                    //配置TextField的样式风格
                    decoration: InputDecoration(
                      //设置输入文本框的提示文字
                      //输入框没有获取焦点，并且没有输入文字的时候显示
                      hintText: '请输入用户名',
                      //设置输入框提示文字的样式
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          textBaseline: TextBaseline.alphabetic),
                      //标题label
                      labelText: '用户名',
                      labelStyle: TextStyle(fontSize: 16.0),
                      //输入框下面的提示文字
                      helperText: '这里是帮助提示语',
                      helperStyle: TextStyle(color: Colors.green),
                      //错误提示语
                      errorText: '这里是错误提示语',
                      errorStyle: TextStyle(color: Colors.red),
                      //输入框前置文字，在获取焦点的时候才会显示出来
                      prefixText: 'prefix',
                      prefixStyle: TextStyle(color: Colors.deepPurple),
                      //输入文本后面的文字
//                      suffixText: 'suffix',
//                      suffixStyle: TextStyle(color: Colors.blue),
                      //输入框右下角显示的计数
                      counterText: 'count',
                      counterStyle: TextStyle(color: Colors.black),
                      //输入文字前的小图标
                      prefixIcon: Icon(Icons.phone),
                      //输入文字的小图标
                      suffixIcon: Icon(Icons.close),
                      //与 prefixText 不能同时设置 widget
//                      prefix: Text('prefix'),
                      //与suffixText不能同时设置 widget
                      suffix: Icon(Icons.message),

                      ///设置边框
                      ///   InputBorder.none 无下划线
                      ///   OutlineInputBorder 上下左右 都有边框
                      ///   UnderlineInputBorder 只有下边框  默认使用的就是下边框
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        //配置边框的样式
                        borderSide: BorderSide(
                          //颜色
                          color: Colors.red,
                          //粗细
                          width: 2.0,
                        ),
                      ),
                      //设置输入框可编辑状态下的边框样式
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      //设置输入框禁用状态下的边框样式
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2.0,
                        ),
                      ),
                      //设置输入框获取焦点时的边框样式
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
