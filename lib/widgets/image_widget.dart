import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
///Flutter 基础 Image
class ImageWidget extends StatefulWidget {
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        leading: BackButton(),
      ),
      body: Column(
        children: <Widget>[

          ///加载网络图片
          Center(
            child: Image.network(
                'https://pics2.baidu.com/feed/aa64034f78f0f736de90e1b9a1a6f01eeac41312.jpeg?token=ab24240c8daec27fc6d809a1236816a6'),
          ),

          ///加载静态图片处理不同的分辨率
          //方式一:
          Image(
            height: 100,
            width: 100,
            image: AssetImage('images/mac.jpeg'),
          ),
          //方式二：
          Image.asset(
            'images/mac.jpeg',
            width: 100,
            height: 100,
          ),

          ///加载内存卡本地图片
          ///拼接完整路径
          FutureBuilder(
            future: _getLocalFile('IMG_20200903_113144.jpg'),
            builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
              return snapshot.data != null
                  ? Image.file(snapshot.data)
                  : Container(
                child: Text('未找到图片'),
              );
            },
          ),

          ///设置图片placeholder
          ///为了设置Placeholder我们需要借助FadeInImage，它能够从内存，本地资源中加载placeholder
          ///也可以加载本地图片作为placeholder
          Stack(
            children: <Widget>[
//              Center(
//                child: CircularProgressIndicator(),
//              ),
              Center(
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image:
                    'https://pics2.baidu.com/feed/aa64034f78f0f736de90e1b9a1a6f01eeac41312.jpeg?token=ab24240c8daec27fc6d809a1236816a6'),
              ),
            ],
          ),

          ///配置图片缓存
          Center(
            child: CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl:'https://pics2.baidu.com/feed/aa64034f78f0f736de90e1b9a1a6f01eeac41312.jpeg?token=ab24240c8daec27fc6d809a1236816a6'
            ),
          ),

          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  ///获取SDcard的路径
  Future<File> _getLocalFile(String fileName) async {
    String dir = (await getExternalStorageDirectory()).path;
    return File('$dir/$fileName');
  }
}
