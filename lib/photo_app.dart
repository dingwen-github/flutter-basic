import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

///拍照app
class PhotoApp extends StatefulWidget {
  @override
  _PhotoAppState createState() => _PhotoAppState();
}

class _PhotoAppState extends State<PhotoApp> {
  List<File> _images = [];
  final picker = ImagePicker();

  Future getImage(bool isTaskPhoto) async {
    //选择图片完成后关闭底部弹窗
    Navigator.pop(context);
    var image = await picker.getImage(
        source: isTaskPhoto ? ImageSource.camera : ImageSource.gallery);

    setState(() {
      _images.add(File(image.path));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
//        child: _image == null
//            ? Text('No image selected.')
//            : Image.file(_image),
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _createImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: '选择图片',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  _pickImage() {
    //弹出底部弹框 showModalBottomSheet是StatefulWidget自带的方法
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 160,
              child: Column(
                children: <Widget>[
                  _item('拍照', true),
                  _item('从相册选择', false),
                ],
              ),
            ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        leading: Icon(isTakePhoto ? Icons.camera_alt : Icons.photo_library),
        title: Text(title),
        onTap: () => getImage(isTakePhoto),
      ),
    );
  }

  _createImages() {
    return  _images.map((file) {
      return Stack(
        children: <Widget>[
          ClipRRect(
            //圆角效果图片
            borderRadius: BorderRadius.circular(5),
            child: Image.file(
              file,
              width: 120,
              height: 90,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            right: 5,
            top: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _images.remove(file);
                });
              },
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }).toList();
  }
}
