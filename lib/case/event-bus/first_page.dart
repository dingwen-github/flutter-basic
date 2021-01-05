import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basic/case/event-bus/confirm_event.dart';
import 'package:flutter_basic/case/event-bus/event_bus_util.dart';
import 'package:flutter_basic/case/event-bus/second_page.dart';
/// EventBus test firstPage
/// @author: dingwen
/// @date: 2020/12/24

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _status= '';

  StreamSubscription<ConfirmEvent> _confirmSubscription;

  @override
  void initState() {
    super.initState();
    //注册监听
    _confirmSubscription = EventBusUtil.listen((event){
      setState(() {
        _status = event.status;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Center(
        child: Text('$_status'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.code),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
      ),
    );
  }

  ///取消监听
  @override
  void dispose() {
    super.dispose();
    _confirmSubscription?.cancel();
  }
}
