import 'package:flutter/material.dart';
import 'package:flutter_basic/case/inherited-widget/share_data_widget.dart';
///作为子[widget]测试
///dingwen
///2020/12/24
class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的数据
    return Text('${ShareDataWidget.of(context).data}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}

