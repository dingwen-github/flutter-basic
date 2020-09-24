import 'package:flutter/material.dart';
import 'package:flutter_basic/demoes/globalkey/switcher_widget.dart';

///Flutter--> 何时使用GlobalKey  GlobalKey能够跨Widget访问状态
class GlobalKeyDemo extends StatefulWidget {
  GlobalKeyDemo({Key key}) : super(key: key);

  @override
  _GlobalKeyDemoState createState() => _GlobalKeyDemoState();
}

class _GlobalKeyDemoState extends State<GlobalKeyDemo> {
  ///如果state类是私有的则不可以访问
  final GlobalKey<SwitcherWidgetState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GlobalKey使用'),
        leading: BackButton(),
      ),
      body: SwitcherWidget(
        key: _globalKey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _globalKey.currentState.changeState(),
        child: Text('切换'),
      ),
    );
  }
}
