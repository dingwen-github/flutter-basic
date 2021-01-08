import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';

///Flutter 绘图  CustomPainter 使用 绘制时钟
class CustomPainterWidget extends StatefulWidget {
  final double radius;
  final Color hourHandColor;
  final Color minuteHandColor;
  final Color secondHandColor;
  final Color numberColor;
  final Color borderColor;

  const CustomPainterWidget({Key key,
    this.radius = 150.0,
    this.hourHandColor,
    this.minuteHandColor,
    this.secondHandColor,
    this.numberColor,
    this.borderColor})
      : super(key: key);

  @override
  _CustomPainterWidgetState createState() => _CustomPainterWidgetState();
}

class _CustomPainterWidgetState extends State<CustomPainterWidget> {
  DateTime dateTime;
  Timer timer;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('CustomPainter'),
        leading: BackButton(),
      ),
      body: CustomPaint(

        ///主绘制工具
        painter: ClockPainter(dateTime,
            numberColor: Colors.black,
            handColor: Colors.black,
            borderColor: Colors.black,
            radius: widget.radius),

        ///画布大小
        size: Size(widget.radius * 2, widget.radius * 2),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}

class ClockPainter extends CustomPainter {
  final Color handColor;
  final Color numberColor;
  final Color borderColor;
  final double radius;
  List<Offset> secondsOffset = [];
  final DateTime datetime;
  TextPainter textPainter;
  double angle;
  double borderWidth;

  ClockPainter(this.datetime,
      {this.radius = 150.0,
        this.handColor = Colors.black,
        this.numberColor = Colors.black,
        this.borderColor = Colors.black}) {
    borderWidth = radius / 14;
    final secondDistance = radius - borderWidth * 2;
    //init seconds offset
    for (var i = 0; i < 60; i++) {
      Offset offset = Offset(
          cos(degToRad(6 * i - 90)) * secondDistance + radius,
          sin(degToRad(6 * i - 90)) * secondDistance + radius);
      secondsOffset.add(offset);
    }

    textPainter = new TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
    angle = degToRad(360 / 60);
  }

  ///绘制
  @override
  void paint(Canvas canvas, Size size) {
    final scale = radius / 150;

    //draw border
    final borderPaint = Paint()

    ///画笔颜色
      ..color = borderColor

    ///绘制模式，画线或者充满
      ..style = PaintingStyle.stroke

    ///线条宽度
      ..strokeWidth = borderWidth;

    ///绘制圆形（圆心坐标，半径，画笔）
    canvas.drawCircle(
        Offset(radius, radius), radius - borderWidth / 2, borderPaint);

    //draw second point
    final secondPPaint = Paint()
      ..strokeWidth = 2 * scale
      ..color = numberColor;
    if (secondsOffset.length > 0) {
      ///绘制点（PointModel枚举，坐标点List，画笔）
      /// PointMode的枚举类型有三个，points（点），lines（线，隔点连接），polygon（线，相邻连接）
      canvas.drawPoints(PointMode.points, secondsOffset, secondPPaint);

      ///保存之前画的内容与canvas的状态
      canvas.save();

      ///平移（x,y）
      canvas.translate(radius, radius);

      List<Offset> bigger = [];
      for (var i = 0; i < secondsOffset.length; i++) {
        if (i % 5 == 0) {
          bigger.add(secondsOffset[i]);

          //draw number
          canvas.save();
          canvas.translate(0.0, -radius + borderWidth * 4);
          textPainter.text = new TextSpan(
            text: "${(i ~/ 5) == 0 ? "12" : (i ~/ 5)}",
            style: TextStyle(
              color: numberColor,
              fontFamily: 'Times New Roman',
              fontSize: 28.0 * scale,
            ),
          );

          //helps make the text painted vertically
          ///0,0 坐标旋转
          canvas.rotate(-angle * i);

          ///新建一个图层
          textPainter.layout();
          textPainter.paint(canvas,
              new Offset(-(textPainter.width / 2), -(textPainter.height / 2)));

          ///保存
          ///将该方法与前面最近的一个save() 或saveLayer()之间的操作合并到一起，save与restore，saveLayer与restore是成对儿出现的，只有save没有restore，是会报错的
          canvas.restore();
        }
        canvas.rotate(angle);
      }
      canvas.restore();

      final biggerPaint = Paint()
        ..strokeWidth = 5 * scale
        ..color = numberColor;
      canvas.drawPoints(PointMode.points, bigger, biggerPaint);
    }

    final hour = datetime.hour;
    final minute = datetime.minute;
    final second = datetime.second;

    // draw hour hand
    Offset hourHand1 = Offset(
        radius - cos(degToRad(360 / 12 * hour - 90)) * (radius * 0.2),
        radius - sin(degToRad(360 / 12 * hour - 90)) * (radius * 0.2));
    Offset hourHand2 = Offset(
        radius + cos(degToRad(360 / 12 * hour - 90)) * (radius * 0.5),
        radius + sin(degToRad(360 / 12 * hour - 90)) * (radius * 0.5));
    final hourPaint = Paint()
      ..color = handColor
      ..strokeWidth = 8 * scale;

    ///给定两点之前绘制线条
    canvas.drawLine(hourHand1, hourHand2, hourPaint);

    // draw minute hand
    Offset minuteHand1 = Offset(
        radius - cos(degToRad(360 / 60 * minute - 90)) * (radius * 0.3),
        radius - sin(degToRad(360 / 60 * minute - 90)) * (radius * 0.3));
    Offset minuteHand2 = Offset(
        radius +
            cos(degToRad(360 / 60 * minute - 90)) * (radius - borderWidth * 3),
        radius +
            sin(degToRad(360 / 60 * minute - 90)) * (radius - borderWidth * 3));
    final minutePaint = Paint()
      ..color = handColor
      ..strokeWidth = 3 * scale;
    canvas.drawLine(minuteHand1, minuteHand2, minutePaint);

    // draw second hand
    Offset secondHand1 = Offset(
        radius - cos(degToRad(360 / 60 * second - 90)) * (radius * 0.3),
        radius - sin(degToRad(360 / 60 * second - 90)) * (radius * 0.3));
    Offset secondHand2 = Offset(
        radius +
            cos(degToRad(360 / 60 * second - 90)) * (radius - borderWidth * 3),
        radius +
            sin(degToRad(360 / 60 * second - 90)) * (radius - borderWidth * 3));
    final secondPaint = Paint()
      ..color = handColor
      ..strokeWidth = 1 * scale;
    canvas.drawLine(secondHand1, secondHand2, secondPaint);

    final centerPaint = Paint()
      ..strokeWidth = 2 * scale
      ..style = PaintingStyle.stroke
      ..color = Colors.yellow;
    canvas.drawCircle(Offset(radius, radius), 4 * scale, centerPaint);
  }

  ///在刷新布局的时候需要重绘
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

num degToRad(num deg) => deg * (pi / 180.0);

num radToDeg(num rad) => rad * (180.0 / pi);
