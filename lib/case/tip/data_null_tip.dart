import 'package:flutter/material.dart';
class DataNullTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.folder_open,
              size: 80,
              color: Colors.blue,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 4.0),
              width: MediaQuery.of(context).size.width / 4,
              height: 2,
              color: Colors.blue,
            ),
            Text('暂无数据',style: TextStyle(color: Colors.blue),),
          ],
        ),
      ),
    );
  }
}
