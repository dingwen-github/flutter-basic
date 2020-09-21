import 'package:flutter/material.dart';
import 'package:flutter_basic/demoes/scoped-model/count_model.dart';
import 'package:scoped_model/scoped_model.dart';

///一级孩子组件
class FirstChild extends StatefulWidget {
  @override
  _FirstChildState createState() => _FirstChildState();
}

class _FirstChildState extends State<FirstChild> {
  ///静态获取model用法实例
  Model getModel(BuildContext context) {
    ///直接使用of
    final countModel = ScopedModel.of<CountModel>(context);

    ///使用CountModel中重写的of
    final countModel2 = CountModel().of(context);
    countModel.increment();
    return countModel;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      ///采用重写of时方式时，rebuildOnChange属性默认为false，所以会导致无法刷新（同步）状态的情况发生，需要手动指定rebuildOnChange：true
//      rebuildOnChange: ,
      builder: (context,child,model){
        return Scaffold(
          appBar: AppBar(
            title: Text('一级子部件'),
            leading: BackButton(),
          ),
          body: Center(
            child: Text(model.count.toString()),
          ),
        );
      },
    );
  }
}
