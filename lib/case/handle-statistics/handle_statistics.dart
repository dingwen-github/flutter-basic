import 'package:approval/views/query/handle-statistics/constant/table_data_init.dart';
import 'package:approval/views/query/handle-statistics/constant/table_type.dart';
import 'package:approval/views/query/handle-statistics/util/weekday_util.dart';
import 'package:approval/views/query/handle-statistics/widget/statistics_table.dart';
import 'package:approval/views/query/handle-statistics/widget/whole_statistics_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';
import 'package:flutter_my_picker/flutter_my_picker.dart';
import 'package:intl/intl.dart';

// 日期操作，需要时引入
import 'package:flutter_my_picker/common/date.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HandleStatistics extends StatefulWidget {
  HandleStatistics(
      {this.startTime = '2019-08-01',
      this.endTime,
      this.weekDayStart = '',
      this.weekDayEnd = ''});

  //统计开始时间
  String startTime;

  //统计结束时间
  String endTime;

  //开始时间周
  String weekDayStart;

  //结束时间周
  String weekDayEnd;

  @override
  _HandleStatisticsState createState() => _HandleStatisticsState();
}

class _HandleStatisticsState extends State<HandleStatistics> {
  TextStyle textStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
  TableDataInit tableDataInitBusiness;
  TableDataInit tableDataInitDepartment;

  //标题
  Widget titleWidget;

  @override
  void initState() {
    super.initState();
    //表格初始化
    tableDataInitBusiness = initTable(tableType: TableType.business);
    tableDataInitDepartment = initTable(tableType: TableType.department);
  }

  @override
  Widget build(BuildContext context) {
    widget.endTime =
        widget.endTime ?? DateFormat('yyyy-MM-dd').format(DateTime.now());
    titleWidget = Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Text("${widget.startTime} 至 ${widget.endTime} 办件数量统计情况",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)));
    return Scaffold(
      appBar: AppBar(
        title: Text('办理数量统计'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildPicker(
              startTime: widget.startTime,
              endTime: widget.endTime,
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: ListTile(
                title: Text(
                  '整体统计',
                  style: textStyle,
                ),
                leading: Icon(
                  Icons.select_all,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            Center(
              child: Container(
                height: 400,
                padding: EdgeInsets.all(20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        titleWidget,
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          //todo
                          child: WholeStatisticsChart.withSampleData(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: ListTile(
                title: Text(
                  '按照业务汇总',
                  style: textStyle,
                ),
                leading: Icon(
                  Icons.business,
                  color: Colors.blue,
                ),
              ),
            ),
            titleWidget,
            //todo
            Center(
              child: StatisticsTable(),
            ),
            Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.topLeft,
              child: ListTile(
                title: Text(
                  '按照部门汇总',
                  style: textStyle,
                ),
                leading: Icon(
                  Icons.near_me,
                  color: Colors.green,
                ),
              ),
            ),
            titleWidget,
            //todo
            Center(
              child: StatisticsTable(),
            ),
            SizedBox(
              height: 60.0,
            ),
          ],
        ),
      ),
    );
  }

  ///表格初始化
  ///tableType: business(按照业务汇总) department(按照部门汇总)
  TableDataInit initTable({TableType tableType}) {
    if (tableType == TableType.business) {
      //todo

    } else if (tableType == TableType.department) {}
  }

  ///构建日期选择器
  Widget _buildPicker({String startTime, String endTime}) {
    DateFormat dateFormat = new DateFormat('yyyy-MM-dd');
    DateFormat weekFormat = DateFormat('EEEE');
    return Card(
        //z轴的高度，设置card的阴影
        elevation: 5.0,
        //设置shape，这里设置成了R角
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        //对Widget截取的行为，比如这里 Clip.antiAlias 指抗锯齿
        clipBehavior: Clip.antiAlias,
        semanticContainer: false,
        margin: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 14.0),
                height: 100,
                width: MediaQuery.of(context).size.width / 2.28,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.timer),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text('开始时间'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 100.0),
                            child: Text(
                              '${widget.startTime}',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          Container(
                            child: Text('${widget.weekDayStart}'),
                          ),
                          Container(
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                MyPicker.showPicker(
                  context: context,
                  current: widget.startTime,
                  mode: MyPickerMode.date,
                  onChange: (date) {
                    setState(() {
                      widget.startTime = dateFormat.format(date);
                      widget.weekDayStart =
                          WeekdayUtil.getZh(weekFormat.format(date));
                    });
                  },
                );
              },
            ),
            Container(
              width: 2,
              height: 60,
              color: Colors.deepOrange,
              child: Text(''),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(right: 14.0),
                height: 100,
                width: MediaQuery.of(context).size.width / 2.28,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 20.0, left: 20.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.timer_off),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text('结束时间'),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.0, top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 100.0),
                            child: Text(
                              '${widget.endTime}',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          Container(
                            child: Text('${widget.weekDayEnd}'),
                          ),
                          Container(
                            child: Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                MyPicker.showPicker(
                  context: context,
                  current: widget.endTime,
                  mode: MyPickerMode.date,
                  onChange: (date) {
                    setState(() {
                      if (DateTime.parse(widget.endTime)
                          .isAfter(DateTime.parse(widget.startTime))) {
                        //结束时间是否在开始时间之后
                        widget.endTime = dateFormat.format(date);
                        widget.weekDayEnd =
                            WeekdayUtil.getZh(weekFormat.format(date));
                      } else {
                        widget.endTime = dateFormat.format(
                            DateTime.parse(widget.startTime)
                                .add(Duration(days: 1)));
                        Fluttertoast.showToast(
                          msg: "结束时间应在开始时间之后", //展示的文字内容
                          toastLength: Toast
                              .LENGTH_LONG, // 时间长短Toast.LENGTH_SHORT、Toast.LENGTH_LONG
                        );
                      }
                    });
                  },
                );
              },
            ),
          ],
        ));
  }
}
