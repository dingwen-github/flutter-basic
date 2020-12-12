import 'package:flutter/material.dart';
///办理数据统计表
///dingwen
///2020/12/12
class StatisticsTable extends StatefulWidget {
  StatisticsTable({this.columnWidths,this.tableRows,this.tableBorder});

  ///列宽集合，每一列逐一指定
  Map<int, TableColumnWidth> columnWidths;
  ///表格的每行（子元素为每一列）
  List<TableRow> tableRows;
  ///表格边框
  TableBorder tableBorder;

  @override
  _StatisticsTableState createState() => _StatisticsTableState();
}

class _StatisticsTableState extends State<StatisticsTable> {
  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      //所有列宽
      columnWidths: const {
        //列宽
        0: FixedColumnWidth(200.0),
        1: FixedColumnWidth(100.0),
        2: FixedColumnWidth(100.0),
        3: FixedColumnWidth(100.0),
      },
      //表格边框样式
      border: TableBorder.all(
        color: Colors.grey[600],
        width: 1.0,
        style: BorderStyle.solid,
      ),
      children: [
        TableRow(
            //第一行样式 添加背景色
            decoration: BoxDecoration(
              color: Colors.grey[400],
            ),
            children: [
              //增加行高
              Container(
                alignment: Alignment.center,
                height: 30.0,
                child: Text(
                  '业务类型',
                  style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold,),
                )
              ),

              Container(
                alignment: Alignment.center,
                child: Text(
                  '报件数',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '办结数',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '在办数',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ]),
        TableRow(children: [
          Text('探矿权新立'),
          Text('男'),
          Text('20'),
          Text('20'),
        ]),
        TableRow(children: [
          Text('探矿权变更'),
          Text('女'),
          Text('28'),
          Text('28'),
        ]),
        TableRow(children: [
          Text('探矿权延续'),
          Text('男'),
          Text('28'),
          Text('28'),
        ]),
        TableRow(children: [
          Text('探矿权延续'),
          Text('男'),
          Text('28'),
          Text('28'),
        ]),
        TableRow(children: [
          Text('探矿权延续'),
          Text('男'),
          Text('28'),
          Text('28'),
        ]),
        TableRow(children: [
          Text('探矿权延续'),
          Text('男'),
          Text('28'),
          Text('28'),
        ]),
        TableRow(children: [
          Text('合计'),
          Text('男'),
          Text('28'),
          Text('28'),
        ]),
      ],
    );
  }
}
