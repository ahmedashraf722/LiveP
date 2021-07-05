import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DonutPieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DonutPieChart(this.seriesList, {this.animate});

  factory DonutPieChart.withSampleData() {
    return new DonutPieChart(
      _createSampleData(),
      animate: false,
    );
  }

  static List<charts.Series<Statistic, int>> _createSampleData() {
    final data = [
      new Statistic(0, 25, Colors.redAccent),
      new Statistic(1, 75, Colors.yellowAccent),
      new Statistic(2, 150, Colors.blueAccent),
    ];
    return [
      new charts.Series<Statistic, int>(
        id: 'Sales',
        domainFn: (Statistic statistic, _) => statistic.id,
        measureFn: (Statistic statistic, _) => statistic.value,
        colorFn: (Statistic statistic, _) =>
            charts.ColorUtil.fromDartColor(statistic.color),
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.ArcRendererConfig(arcWidth: 20),
    );
  }
}

class Statistic {
  final int id;
  final int value;
  final Color color;

  Statistic(this.id, this.value, this.color);
}
