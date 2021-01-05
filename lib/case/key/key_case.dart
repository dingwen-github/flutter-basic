import 'package:flutter/material.dart';
import 'package:flutter_basic/case/key/Student.dart';

///导入math
import 'dart:math' as Math;

import 'package:flutter_basic/case/key/container_widget.dart';

/// flutter LocalKey 案例
/// dingwen
/// 2020/12/24
class KeyCase extends StatefulWidget {
  @override
  _KeyCaseState createState() => _KeyCaseState();
}

class _KeyCaseState extends State<KeyCase> {
//  final redKey = UniqueKey();
//  final orangeKey = UniqueKey();
//  final blueKey = UniqueKey();


final redObject = Student(id: '001',name: '001');
final orangeObject = Student(id: '001',name: '001');
final blueObject = Student(id: '001',name: '001');

final globalKey = GlobalKey();

bool isGlobalKeyCase = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter LocalKey Case'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: !isGlobalKeyCase ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ///可选参数必须在最后面
              ///
              ///ValueKey
//              ContainerWidget(ValueKey('blue'),color: Colors.blue,),
//              ContainerWidget(ValueKey('orange'),color: Colors.orange,),
//              ContainerWidget(ValueKey('red'),color: Colors.red,),

            /// UniqueKey
//              ContainerWidget(redKey,color: Colors.red,),
//              ContainerWidget(blueKey,color: Colors.orange,),
//              ContainerWidget(orangeKey,color: Colors.blue,),

            /// ObjectKey

                ContainerWidget(
                  key: ObjectKey(blueObject),
                  color: Colors.blue,
                ),
                ContainerWidget(
                  key: ObjectKey(redObject),
                  color: Colors.red,
                ),
                ContainerWidget(
                  key: ObjectKey(orangeObject),
                  color: Colors.orange,
                ),

              
            ],
//              InheritedWidget
//              Notification
          ): Flex(
            direction: MediaQuery.of(context).orientation == Orientation.portrait ? Axis.vertical : Axis.horizontal,
            children: [
              ContainerWidget(
                color: Colors.blue,
              ),
              Center(
                key: globalKey,
                child: ContainerWidget(
                  color: Colors.red,
                ),
              ),
              ContainerWidget(
                color: Colors.orange,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //可以获取到当前widget的属性
          print(globalKey.currentWidget);
          //可以获取到state属性
          print(globalKey.currentState);
          final renderBox = globalKey.currentContext.findRenderObject() as RenderBox;
          //当前widget的位置
          print(renderBox.localToGlobal(Offset.zero));
        },
      ),
    );
  }
}
