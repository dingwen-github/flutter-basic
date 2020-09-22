import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'disable_screenshots.dart';

class WaterMark extends StatefulWidget {
  @override
  _WaterMarkState createState() => _WaterMarkState();
}

class _WaterMarkState extends State<WaterMark> {
  // 初始化插件
  DisableScreenshots _plugin = DisableScreenshots();

  // 监控截屏行为的stream
  StreamSubscription<void> _screenshotsSubscription;
  int _screenshotsCount = 0;
  bool _disableScreenshots = false;

  @override
  void initState() {
    super.initState();
    _screenshotsSubscription = _plugin.onScreenShots.listen((event) {
      // 监控到截屏行为会回调到这里
      setState(() {
        _screenshotsCount++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('禁止截屏'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Text("监控到截屏次数：$_screenshotsCount"),
          ),
          Center(
            child: Text(_disableScreenshots ? "禁止截屏状态" : "允许截屏状态"),
          ),
          RaisedButton(
              onPressed: () {
                // 添加默认样式的水印
                _plugin.addWatermark(context, "默认水印",
                    rowCount: 4, columnCount: 8);
              },
              child: Text("添加默认水印")),
          RaisedButton(
              onPressed: () {
                TextStyle textStyle = TextStyle(fontSize: 20,
                    color: Colors.red[200],
                    decoration: TextDecoration.none);
                // 添加自定义widget当做水印
                _plugin.addCustomWatermark(context: context,
                    rowCount: 3,
                    columnCount: 10,
                    watermark: '冻结',
                    textStyle: textStyle);
              },
              child: Text("添加自定义水印")),
          RaisedButton(
              onPressed: () {
                // 移除水印
                _plugin.removeWatermark();
              },
              child: Text("删除水印")),
          RaisedButton(
              onPressed: () async {
                bool flag = !_disableScreenshots;
                // 禁用或允许截屏（只支持iOS）
                await _plugin.disableScreenshots(flag);
                setState(() {
                  _disableScreenshots = flag;
                });
              },
              child: Text(_disableScreenshots
                  ? "允许截屏（仅android适用）"
                  : "禁用截屏（仅android适用)")),
          RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) =>
                        Scaffold(
                          appBar: AppBar(
                            title: Text("我是新页面"),
                          ),
                          body: Center(child: Text("new page")),
                        )));
              },
              child: Text("进入新页面"))
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //取消截屏监控可以调用cancel()方法
    if (_screenshotsSubscription != null) {
      _screenshotsSubscription.cancel();
    }
  }

  Widget Watarmark({int rowCount, int columnCount, String text}) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.red),
    );
  }
}
