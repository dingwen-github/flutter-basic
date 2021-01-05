
import 'package:flutter/material.dart';
import 'package:flutter_basic/case/event-bus/confirm_event.dart';
import 'package:flutter_basic/case/event-bus/event_bus_util.dart';
/// EventBus test second page
/// @author: dingwen
/// @date: 2020/12/24

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
        centerTitle: true,
        leading: BackButton(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.event),
        onPressed: (){
          EventBusUtil.fire(ConfirmEvent(status: 'second page confirm send data'));
          Navigator.pop(context);
        },
      ),
    );
  }
}
