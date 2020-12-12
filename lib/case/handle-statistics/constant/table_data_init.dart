import 'package:flutter/cupertino.dart';

class TableDataInit{
  TableDataInit({this.columnWidths,this.tableRows,this.tableBorder});
  ///列宽集合，每一列逐一指定
  Map<int, TableColumnWidth> columnWidths;
  ///表格的每行（子元素为每一列）
  List<TableRow> tableRows;
  ///表格边框
  TableBorder tableBorder;
}