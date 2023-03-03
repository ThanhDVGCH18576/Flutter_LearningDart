import 'package:charts_flutter/flutter.dart' as charts;

class LineChartSeries {
  final String year;
  final int developers;
  final charts.Color barColor;

  LineChartSeries(
    {
      required this.year,
      required this.developers,
      required this.barColor
    }
  );
}