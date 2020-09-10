import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// WebView 使用Demo
class WebViewDemo extends StatefulWidget {
  @override
  _WebViewDemoState createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView使用'),
        leading: BackButton(),
      ),
      body: WebView(
        //地址
        initialUrl: "http://192.168.0.117:8080/#/a",
        //JS执行模式 默认是不调用
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
