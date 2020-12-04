import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/case/paginated-data_table/user.dart';
import 'package:flutter_basic/case/paginated-data_table/my_data_table_source.dart';

class TableTest extends StatefulWidget {
  @override
  _TableTestState createState() => _TableTestState();
}

class _TableTestState extends State<TableTest> {
  List<User> _data = [];
  int rowsPerPage = 10;
  var _sortAscending = true;
  TextStyle _textStyle = TextStyle(
      fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    List.generate(100, (index) {
      _data.add(User('$index', index % 50, index % 2 == 0 ? '男' : '女'));
    });
    // 强制横屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('table test'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: PaginatedDataTable(
          ///表格顶部控件
          header: Text('办理进度'),

          ///表格右边控件
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
          onRowsPerPageChanged: (v) {
            setState(() {
              rowsPerPage = v;
            });
          },
          availableRowsPerPage: [5, 10, 15, 16],

          ///每页显示的行数，默认是10
          rowsPerPage: rowsPerPage,

          ///列头控件
          columns: [
            DataColumn(
                label: Text(
              '案卷时限',
              style: _textStyle,
            )),
            DataColumn(
                label: Text(
              '收件编号',
              style: _textStyle,
            )),
            DataColumn(
                label: Text(
              '申请序号',
              style: _textStyle,
            )),
            DataColumn(
                label: Text(
              '案卷编号',
              style: _textStyle,
            )),
            DataColumn(
                label: Text(
              '项目名称',
              style: _textStyle,
            )),
            DataColumn(
                label: Text(
                  '申请时间',
                  style: _textStyle,
                ),
                onSort: (index, sortAscending) {
                  setState(() {
                    _sortAscending = sortAscending;
                    if (sortAscending) {
                      _data.sort((a, b) => a.age.compareTo(b.age));
                    } else {
                      _data.sort((a, b) => b.age.compareTo(a.age));
                    }
                  });
                }),
            DataColumn(
                label: Text(
              '结束时间',
              style: _textStyle,
            )),
            DataColumn(
                label: Text(
              '当前状态',
              style: _textStyle,
            )),
            DataColumn(
                label: Text(
              '操作',
              style: _textStyle,
            )),
          ],

          ///数据源
          source: MyDataTableSource(_data),

          ///翻页时的回调
          onPageChanged: (page) {
            print(page);
          },

          ///升序降序设置
          sortColumnIndex: 2,
          sortAscending: _sortAscending,

          ///全选控制
          onSelectAll: (all) {
            setState(() {
              _data.forEach((f) {
                f.selected = all;
              });
            });
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // 强制竖屏
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}
