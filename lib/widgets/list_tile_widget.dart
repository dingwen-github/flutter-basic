import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Flutter 基础组件-ListTitle
///一个固定高度呢行，通常包含标题、副标题、行前图标、行后图标
class ListTileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件-ListTitle'),
        leading: BackButton(),
      ),
      body: Container(
        child: ListTile(
          ///最左侧的头部，参数是一个widget
          leading: Icon(Icons.cake,),
          ///标题,参数widget
          title: Text('标题'),
            ///副标题，widget
          subtitle: Row(
            children: <Widget>[
              Text('副标题'),
              Icon(Icons.person),
          ],
        ),
          ///展示在title后面的后置组件 widget
          trailing: Icon(Icons.save),
          ///点击事件
          onTap: ()=> print('点击事件'),
          onLongPress: ()=> print('长按'),
          ///默认是false,是否默认三行高度，subtitle不为空是才能使用 bool
          isThreeLine: true,
          ///bool，让List tiles 有更小的高度
          dense: true,
          ///默认为true ,是否能被点击
          enabled: true,
          ///默认值为false，是否默认被选中,呈现当前的主题颜色
          selected: true,
        ),
      ),
    );
  }
}
