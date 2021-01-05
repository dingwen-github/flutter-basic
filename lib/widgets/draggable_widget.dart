import 'package:flutter/material.dart';
/// draggable widget demo
/// @author: dingwen
/// @date: 2020/12/25

class DraggableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DraggableWidget'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Center(
        child: Draggable(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
          //按下去以及拖走的状态
          feedback: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
          //留在原地的状态
          childWhenDragging: Container(
            width: 100,
            height: 100,
            color: Colors.grey,
          ),
          onDragStarted: (){
            print('onDragStarted');
          },
          onDraggableCanceled: (velocity,offset){
            print(velocity);
            print(offset);
            print('onDraggableCanceled');
          },
          onDragCompleted: (){
            print('onDragCompleted');
          },
          onDragEnd: (details){
            print('onDragEnd');
            print(details);
          },
        ),
      ),
    );
  }
}
