// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:learningdart/views/pie_chart/pie_chart.dart';
import 'package:learningdart/views/pie_chart/pie_chart_series.dart';
import 'bar_chart/bar_chart.dart';
import 'bar_chart/bar_chart_series.dart';
import 'bottom_navigation.dart';
import 'line_chart/line_chart.dart';
import 'line_chart/line_chart_series.dart';

class NoteView extends StatefulWidget {
  @override
  State<NoteView> createState() => _NoteViewState();
}

enum MenuAction { logout }

class _NoteViewState extends State<NoteView> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final List<BarChartSeries> barChartData = [
    BarChartSeries(
      year: "2017",
      developers: 40000,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    BarChartSeries(
      year: "2018",
      developers: 10000,
      barColor: charts.ColorUtil.fromDartColor(Color.fromARGB(255, 255, 2, 2)),
    ),
    BarChartSeries(
      year: "2019",
      developers: 40000,
      barColor:
          charts.ColorUtil.fromDartColor(Color.fromARGB(255, 119, 0, 255)),
    ),
    BarChartSeries(
      year: "2020",
      developers: 30000,
      barColor:
          charts.ColorUtil.fromDartColor(Color.fromARGB(255, 255, 221, 0)),
    ),
    BarChartSeries(
      year: "2021",
      developers: 45000,
      barColor:
          charts.ColorUtil.fromDartColor(Color.fromARGB(255, 255, 0, 221)),
    ),
  ];

  // final List<PieChartSeries> pieChartData = [
  //   PieChartSeries(
  //     year: "2017",
  //     developers: 40000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   PieChartSeries(
  //     year: "2018",
  //     developers: 5000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   PieChartSeries(
  //     year: "2019",
  //     developers: 40000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   PieChartSeries(
  //     year: "2020",
  //     developers: 35000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   PieChartSeries(
  //     year: "2021",
  //     developers: 45000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  // ];

  // final List<LineChartSeries> lineChartData = [
  //   LineChartSeries(
  //     year: "2017",
  //     developers: 40000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   LineChartSeries(
  //     year: "2018",
  //     developers: 5000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   LineChartSeries(
  //     year: "2019",
  //     developers: 40000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   LineChartSeries(
  //     year: "2020",
  //     developers: 35000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  //   LineChartSeries(
  //     year: "2021",
  //     developers: 45000,
  //     barColor: charts.ColorUtil.fromDartColor(Colors.green),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavagation(tabKey: 1),
      backgroundColor: Color.fromARGB(255, 225, 222, 235),
      appBar: AppBar(
        title: Text("Chart",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Colors.deepPurple,
        actions: [
          PopupMenuButton<MenuAction>(
            color: Color.fromARGB(255, 247, 247, 247),
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    await FirebaseAuth.instance.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login/',
                      (route) => false,
                    );
                  }
                  break;
              }
            },
            itemBuilder: (context) {
              return const [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text("Đăng xuất"),
                )
              ];
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BarChart(data: barChartData),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Đăng xuất"),
          content: const Text("Bạn có chắc muốn thoát đăng xuất?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: const Text("Đăng xuất")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text("Hủy bỏ")),
          ],
        );
      }).then((value) => value ?? false);
}
