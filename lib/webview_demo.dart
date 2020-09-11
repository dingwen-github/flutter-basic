import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// WebView 使用Demo
class WebViewDemo extends StatefulWidget {
  @override
  _WebViewDemoState createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {
  // 设置状态
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WebView使用'),
        leading: BackButton(),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            //地址
            initialUrl: "http://192.168.0.117:8081/flutter",
            //JS执行模式 默认是不调用
            javascriptMode: JavascriptMode.unrestricted,
            navigationDelegate: (NavigationRequest request) {
              var url = request.url;
              print("visit $url");
              setState(() {
                // 开始访问页面，更新状态
                isLoading = true;
              });

              return NavigationDecision.navigate;
            },
            onPageFinished: (String url) {
              setState(() {
                isLoading = false; // 页面加载完成，更新状态
              });
            },
          ),
          isLoading
              ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
              : Container(),
        ],
      ),
    );
  }
}
