import 'package:charts_flutter/flutter.dart' as charts;

class BarChartSeries {
  final String year;
  final int developers;
  final charts.Color barColor;

  BarChartSeries(
    {
      required this.year,
      required this.developers,
      required this.barColor
    }
  );
}