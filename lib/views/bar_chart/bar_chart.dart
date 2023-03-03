import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'bar_chart_series.dart';

class BarChart extends StatelessWidget {
  final List<BarChartSeries> data;
  BarChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartSeries, String>> series = [
      charts.Series(
        id: "developers",
        data: data,
        domainFn: (BarChartSeries series, _) => series.year,
        measureFn: (BarChartSeries series, _) => series.developers,
        colorFn: (BarChartSeries series, _) => series.barColor
      )
    ];

    return Container(
      height: 300,
      padding: EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                "Yearly Growth in the Flutter Community",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Expanded(
                child: charts.BarChart(series,animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}