import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final data = [
    ChartData('Mon', 20),
    ChartData('Tue', 25),
    ChartData('Wed', 30),
    ChartData('Thu', 10),
    ChartData('Fri', 15),
  ];

  @override
  Widget build(BuildContext context) {
    var series = [
      charts.Series(
        domainFn: (ChartData clickData, _) => clickData.day,
        measureFn: (ChartData clickData, _) => clickData.value,
        id: 'Sales',
        data: data,
        fillColorFn: (ChartData clickData, _) {
          return charts.MaterialPalette.green.shadeDefault;
        },
      ),
    ];

    var chart = charts.BarChart(
      series,
      animate: true,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Sales by Day of the Week',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Expanded(
                  child: chart,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String day;
  final int value;

  ChartData(this.day, this.value);
}
