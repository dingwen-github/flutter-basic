import 'package:flutter/material.dart';

class CustomCheckBoxListTile extends StatefulWidget {
  @override
  _CustomCheckBoxListTileState createState() => _CustomCheckBoxListTileState();
}

class _CustomCheckBoxListTileState extends State<CustomCheckBoxListTile> {
  var _selected = false;
  List _indexList = [0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: BackButton(),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        color: Colors.grey.withAlpha(22),
        child: ListView.separated(
            itemBuilder: (context, index) =>
                CheckboxListTile(
                  value: _indexList.contains(index),
                  checkColor: Colors.yellow,
                  activeColor: Colors.orangeAccent,
                  secondary: Image.network(
                      "https://csdnimg.cn/cdn/content-toolbar/csdn-logo.png?v=20200416.1"),
                  title: Text("张风捷特烈"),
                  subtitle: Text("@万花过尽知无物"),
                  onChanged: (v) =>
                      setState(() {
                        print(index);
                        if (!_indexList.contains(index)) {
                          _indexList.add(index);
                        } else {
                          _indexList.remove(index);
                        }
                        if (_indexList.contains(index)) {
                          _selected = !_selected;
                        }
                      }),
                ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 20),
      ),
    );
  }
}
