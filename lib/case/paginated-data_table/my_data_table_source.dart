import 'package:flutter/material.dart';
import 'package:flutter_basic/case/paginated-data_table/user.dart';

class MyDataTableSource extends DataTableSource {
  MyDataTableSource(this.data);

  final List<User> data;

  ///获取每一行的数据返回
  @override
  DataRow getRow(int index) {
    if (index >= data.length) {
      return null;
    }
    return DataRow.byIndex(
      index: index,
      selected: data[index].selected,
      onSelectChanged: (selected) {
        data[index].selected = selected;
        notifyListeners();
      },
      cells: [
        DataCell(
          Text('${data[index].name}'),
        ),
        DataCell(Text('${data[index].sex}')),
        DataCell(Text('${data[index].age}')),
        DataCell(Text('${data[index].age}')),
        DataCell(Text('${data[index].age}')),
        DataCell(Text('${data[index].age}')),
        DataCell(Text('${data[index].age}')),
        DataCell(Text('${data[index].age}')),
        DataCell(Row(children: [
          Icon(Icons.calendar_view_day,color: Colors.orange,),
          Container(
            width: 20,
          ),
          Icon(Icons.book,color: Colors.blue,),
        ],)),
      ],
    );
  }

  ///总共选中的行数
  @override
  int get selectedRowCount {
    return 0;
  }

  /// true 行数无穷大
  @override
  bool get isRowCountApproximate {
    return false;
  }

  @override
  int get rowCount {
    return data.length;
  }
}