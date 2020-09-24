import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/demoes/inheritedwidget/share_data_widget.dart';
import 'package:flutter_basic/demoes/inheritedwidget/test_widget.dart';

class FatherWidget extends StatefulWidget {
  @override
  _FatherWidgetState createState() => _FatherWidgetState();
}

class _FatherWidgetState extends State<FatherWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget'),
        leading: BackButton(),
      ),
      body: Center(
        child: ShareDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: TestWidget(),
              ),
              RaisedButton(
                onPressed: () => setState(() => count++),
                child: Text('Increment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
