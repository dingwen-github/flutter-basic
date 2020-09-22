import 'package:flutter/material.dart';
import 'package:flutter_basic/model/CommonModel.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

///Flutter FutureBuilder
///FutureBuilder是一个将异步操作和异步UI更新结合在一起的类，通过它我们可以将网络请求，数据库读取等的结果更新的页面上
class HttpFutureBuilderDemo extends StatefulWidget {
  @override
  _HttpFutureBuilderDemoState createState() => _HttpFutureBuilderDemoState();
}

class _HttpFutureBuilderDemoState extends State<HttpFutureBuilderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder'),
      ),
      body: FutureBuilder<CommonModel>(
        future: _fetchGet(),
        builder: (BuildContext context, AsyncSnapshot<CommonModel> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('ConnectionState.none');
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
              return Text('ConnectionState.active');
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(
                  '${snapshot.error}', style: TextStyle(color: Colors.red),);
              } else {
                return Column(
                  children: <Widget>[
                    Text('icon:${snapshot.data.icon}'),
                    Text('statusBarColor:${snapshot.data.statusBarColor}'),
                    Text('title:${snapshot.data.title}'),
                    Text('url:${snapshot.data.url}'),
                  ],
                );
              }
          }
          return Container();
        },
      ),
    );
  }

  Future<CommonModel> _fetchGet() async {
    final response = await Http.get(
        'http://www.devio.org/io/flutter_app/json/test_common_model.json');
    Utf8Decoder utf8decoder = Utf8Decoder();
    var result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }
}
