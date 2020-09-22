import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

///打开第三方APP
class LaunchPage extends StatefulWidget {
  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何打开第三方应用？'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () => _launchURL(),
              child: Text('打开浏览器'),
            ),
            RaisedButton(
              onPressed: () => _openMap(),
              child: Text('打开地图'),
            ),
          ],
        ),
      ),
    );
  }

//打开浏览器
  _launchURL() async {
    const url = 'http://www.devio.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //打开地图
  _openMap() async {
    const url = 'androidamap://keywordNavi?sourceApplication=softname&keyword=爱情海购物公园&style=2';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
