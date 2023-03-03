import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'line_chart_series.dart';

class LineChart extends StatelessWidget {
  final List<LineChartSeries> data;
  LineChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<LineChartSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (LineChartSeries series, _) => series.year,
          measureFn: (LineChartSeries series, _) => series.developers,
          colorFn: (LineChartSeries series, _) => series.barColor)
    ];

    return Container(
      height: 400,
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
              Center(
                  child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(),
                  child: Expanded(
                    child: charts.LineChart(
                        series.cast<charts.Series<dynamic, num>>(),
                        domainAxis: const charts.NumericAxisSpec(
                          tickProviderSpec: charts.BasicNumericTickProviderSpec(
                              zeroBound: false),
                          viewport: charts.NumericExtents(2016.0, 2022.0),
                        ),
                        animate: true),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
