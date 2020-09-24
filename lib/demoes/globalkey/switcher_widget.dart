import 'package:flutter/material.dart';

///选择框小部件
class SwitcherWidget extends StatefulWidget {
  SwitcherWidget({Key key}) : super(key: key);

  @override
  SwitcherWidgetState createState() => SwitcherWidgetState();
}

class SwitcherWidgetState extends State<SwitcherWidget> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Switch.adaptive(
            value: isActive,
            activeColor: Colors.blueAccent,
            onChanged: (currentStatus) {
              setState(() {
                isActive = currentStatus;
              });
            }),
      ),
    );
  }

  changeState() {
    setState(() {
      isActive = !isActive;
    });
  }
}
