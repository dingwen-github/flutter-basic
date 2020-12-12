///办理数量总计饼图（总报件，已办结，办理中）
/// dingwen
/// 2020/12/11
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class WholeStatisticsChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  WholeStatisticsChart({this.seriesList, this.animate});

  factory WholeStatisticsChart.withSampleData() {
    return new WholeStatisticsChart(
      seriesList: _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }


  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
        ]));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<HandleCount, int>> _createSampleData() {
    final data = [
      HandleCount(rank: 1,count: 5000,label: '总报件'),
      HandleCount(rank: 2,count: 3000,label: '已办结'),
      HandleCount(rank: 3,count: 2000,label: '办理中')
    ];

    return [
      new charts.Series<HandleCount, int>(
        id: 'handleCount',
        domainFn: (HandleCount handleCount, _) => handleCount.rank,
        measureFn: (HandleCount handleCount, _) => handleCount.count,
        data: data,
        labelAccessorFn: (HandleCount row, _) => '${row.label}: ${row.count}',
      )
    ];
  }
}


class HandleCount{
  final int rank;
  final int count;
  final String label;
  HandleCount({this.rank, this.count,this.label});
}