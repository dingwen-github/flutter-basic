import 'package:flutter/material.dart';
import 'package:flutter_basic/demoes/inheritedwidget/share_data_widget.dart';
class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context).data.toString());
  }

  ///父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
  ///如果build中没有依赖InheritedWidget，则此回调不会被调用。
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('dependencies change');
  }
}
