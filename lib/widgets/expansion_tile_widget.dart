import 'package:flutter/material.dart';

///Flutter 基础组件 ExpansionTile
const CITY_NAMES = {
  '北京': ['东城区', '西城区', '朝阳区', '丰台区', '石景山区', '海淀区', '顺义区'],
  '上海': ['黄浦区', '徐汇区', '长宁区', '静安区', '普陀区', '闸北区', '虹口区'],
  '广州': ['越秀', '海珠', '荔湾', '天河', '白云', '黄埔', '南沙', '番禺'],
  '深圳': ['南山', '福田', '罗湖', '盐田', '龙岗', '宝安', '龙华'],
  '杭州': ['上城区', '下城区', '江干区', '拱墅区', '西湖区', '滨江区'],
  '苏州': ['姑苏区', '吴中区', '相城区', '高新区', '虎丘区', '工业园区', '吴江区']
};

class ExpansionTileWidget extends StatefulWidget {
  @override
  _ExpansionTileWidgetState createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionTile'),
        leading: BackButton(),
      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
    );
  }

  _buildList() {
    List<Widget> widgets = [];
    CITY_NAMES.keys.forEach((key) {
      widgets.add(_buildItem(key, CITY_NAMES[key]));
    });
    return widgets;
  }
}


Widget _buildItem(String city, List<String> subCities) {
  return ExpansionTile(
    //标题左侧要展示的widget
    leading: Icon(Icons.title),
    //标题
    title: Text(
      city,
      style: TextStyle(color: Colors.black54, fontSize: 20.0),
    ),
    //背景颜色
    backgroundColor: Colors.white,
    //标题右侧要展示的widget
    trailing: Icon(Icons.map),
    //默认状态下是否展开
    initiallyExpanded: false,
    children: subCities.map((subCity) => _buildSub(subCity)).toList(),
    //展开收起的回调
    onExpansionChanged: (val) => print(val),
  );
}

Widget _buildSub(String subCity) {
  ///FractionallySizeBox宽度占满全屏
  return FractionallySizedBox(
    widthFactor: 1,
    child: Container(
      height: 50.0,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
      ),
      child: Text(subCity),
    ),
  );
}
