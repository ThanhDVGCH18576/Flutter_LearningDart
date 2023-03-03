import 'package:charts_flutter/flutter.dart' as charts;

class PieChartSeries {
  final String year;
  final int developers;
  final charts.Color barColor;

  PieChartSeries(
    {
      required this.year,
      required this.developers,
      required this.barColor
    }
  );
}