import 'package:flutter/material.dart';

/// 关于我们弹窗
/// @author: dingwen
/// @date: 2021/1/12

class ShowAboutDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowAboutDialogDemo'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        onPressed: () {
          showAboutDialog(
            context: context,
            applicationIcon: Image.asset(
              'images/mac.png',
              height: 100,
              width: 100,
            ),
            applicationName: '应用程序',
            applicationVersion: '1.0.0',
            applicationLegalese: 'copyright dingwen',
            children: <Widget>[
              Container(
                height: 30,
                color: Colors.red,
              ),
              Container(
                height: 30,
                color: Colors.blue,
              ),
              Container(
                height: 30,
                color: Colors.green,
              )
            ],
          );
        },
      ),
    );
  }
}
