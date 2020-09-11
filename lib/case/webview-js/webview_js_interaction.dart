import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

///Flutter WebView 和 js 交互
class WebViewJsInteraction extends StatefulWidget {
  @override
  _WebViewJsInteractionState createState() => _WebViewJsInteractionState();
}

class _WebViewJsInteractionState extends State<WebViewJsInteraction> {
  bool isLoading = true;
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  WebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter And JavaScript Interaction'),
        leading: BackButton(),
      ),
      body: Builder(builder: (BuildContext context){
        return Stack(
          children: <Widget>[
            WebView(
              initialUrl: 'http://192.168.0.117:8081/flutter',
              ///JS执行模式，支持JS
              /// 使用JS没限制
              javascriptMode: JavascriptMode.unrestricted,
              //加载进度条
              navigationDelegate: (NavigationRequest request){
                if (request.url.startsWith('https://www.baidu.com')) {
                  Fluttertoast.showToast(msg: 'JS调用了Flutter By navigationDelegate');
                  print('blocking navigation to $request}');
                  // 阻止进入页面
                  return NavigationDecision.prevent;
                }
                print('allowing navigation to $request');
                setState(() {
                  //开始访问页面，显示加载进度条
                  isLoading = true;
                });
                return NavigationDecision.navigate;
              },
              onWebViewCreated: (WebViewController webViewController){
                _controller.complete(webViewController);
                _webViewController = webViewController;
              },
              //页面加载完成，更新状态
              onPageFinished: (String url){
                print('Page finished loading: $url');
                setState(() {
                  isLoading = false;
                });
                // 之后可以调用 _webViewController 的 evaluateJavascript 属性来注入JS
                this._webViewController?.evaluateJavascript('javaScriptToFlutter()')?.then((result){});
              },
              javascriptChannels: <JavascriptChannel>[
                _alertJavaScriptChannel(context)
              ].toSet(),
            ),
            isLoading ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ): Container(),
          ],
        );
      },),
      floatingActionButton: _jsButton(),
    );
  }

  JavascriptChannel _alertJavaScriptChannel(BuildContext context){
    return JavascriptChannel(
      name: 'Toast',
      onMessageReceived: (JavascriptMessage message){
        Fluttertoast.showToast(msg: message.message);
      }
    );
  }


  Widget _jsButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              onPressed: () async {
                _controller.future.then((controller) {
                  controller
                      .evaluateJavascript('callJS("block")')
                      .then((result) {});
                });
              },
              child: Text('call JS'),
            );
          }
          return Container();
        });
  }
}
