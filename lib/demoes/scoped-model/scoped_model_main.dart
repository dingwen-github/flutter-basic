import 'package:flutter/material.dart';
import 'package:flutter_basic/demoes/scoped-model/count_model.dart';
import 'package:flutter_basic/demoes/scoped-model/first_child.dart';
import 'package:flutter_basic/demoes/scoped-model/second_child.dart';
import 'package:scoped_model/scoped_model.dart';
///顶层父组件---test
class ScopedModelMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('顶层父组件---test'),
        leading: BackButton(),
      ),
      ///一级孩子
      body: FirstChild(),
    );
  }
}
