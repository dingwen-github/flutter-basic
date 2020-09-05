import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 中的资源导入
class ResourcePage extends StatefulWidget {
  @override
  _ResourcePageState createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter 资源导入'),
          leading: GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            child: Image(
              width: 30,
              height: 30,
              image: AssetImage('images/wechat_header_img.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
