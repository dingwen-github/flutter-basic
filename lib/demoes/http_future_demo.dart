import 'package:flutter/material.dart';
import 'package:flutter_basic/model/CommonModel.dart';
import 'package:http/http.dart' as Http;
import 'dart:convert';

///Flutter http
class HttpFutureDemo extends StatefulWidget {
  @override
  _HttpFutureDemoState createState() => _HttpFutureDemoState();
}

class _HttpFutureDemoState extends State<HttpFutureDemo> {
  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http'),
        leading: BackButton(),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('发起Http请求'),
            onPressed: () {
              ///如果catchError与onError同时存在，则会只调用onError
              _fetchGet()
                  .then((CommonModel commonModel) {
                    setState(() {
                      data = commonModel.toString();
                    });
                  }, onError: (onError) {
                    print(onError);
                  })
                  .catchError((catchError) {
                    print(catchError);
                  })
                  .whenComplete(() {
                    print('无论成功与否最终都会执行');
                  })
                  .timeout(Duration(seconds: 2))
                  .then(print)
                  .catchError(print);
            },
          ),
          Center(),
          Expanded(
            child: Container(
              child: Text(data),
            ),
          ),
        ],
      ),
    );
  }

  ///要将异步转同步，那么可以借助async await来完成
  Future<CommonModel> _fetchGet() async {
    final response = await Http.get(
        'http://www.devio.org/io/flutter_app/json/test_common_model.json');

    ///解决中文乱码
    Utf8Decoder utf8decoder = Utf8Decoder();
    final result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }
}
