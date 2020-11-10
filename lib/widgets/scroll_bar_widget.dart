import 'package:flutter/material.dart';

///ListView 显示滚动条
class ScrollBarWidget extends StatefulWidget {
  @override
  _ScrollBarWidgetState createState() => _ScrollBarWidgetState();
}

class _ScrollBarWidgetState extends State<ScrollBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              height: 45,
              alignment: Alignment.center,
              child: Text('$index'),
            ),
          );
        },
        ///Item数量
        itemCount: 30,
        ///确定每一个Item的高度，可以提高效率
        itemExtent: 50,
      ),
    );
  }
}
