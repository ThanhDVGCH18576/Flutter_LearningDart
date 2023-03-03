import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'pie_chart_series.dart';

class PieChart extends StatelessWidget {
  final List<PieChartSeries> data;
  PieChart({required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<PieChartSeries, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (PieChartSeries series, _) => series.year,
          measureFn: (PieChartSeries series, _) => series.developers,
          colorFn: (PieChartSeries series, _) => series.barColor)
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
                child: charts.PieChart(series,
                    defaultRenderer: charts.ArcRendererConfig(
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ]),
                    animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
