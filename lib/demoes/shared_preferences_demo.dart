import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

///Flutter 本地数据存储方案
class SharedPreferencesDemo extends StatefulWidget {
  @override
  _SharedPreferencesDemoState createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  String counterString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('shared_preferences'),
        leading: BackButton(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Increment Counter'),
              onPressed: _incrementCounter,
            ),
            RaisedButton(
              child: Text('Get Counter'),
              onPressed: _getCounter,
            ),
            Text(
              counterString,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'result:$localCount',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      counterString = counterString + '-> 1';
    });
    int counter = (sharedPreferences.getInt('counter') ?? 0) + 1;
    await sharedPreferences.setInt('counter', counter);
  }

  _getCounter() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      localCount = (sharedPreferences.getInt('counter') ?? 0).toString();
    });
  }
}
