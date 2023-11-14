import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  final String x;
  final double y;
  final Color color;

  ChartData(this.x, this.y, this.color);
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class MyChart extends StatefulWidget {
  MyChart({Key? key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  late List<_ChartData> data;

  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('MON', 12),
      _ChartData('TUE', 15),
      _ChartData('WEN', 30),
      _ChartData('THE', 6.4),
      _ChartData('FRI', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [
      ChartData('Category A', 30, Colors.blue),
      ChartData('Category B', 20, Colors.green),
      ChartData('Category C', 25, Colors.red),
      ChartData('Category D', 15, Colors.orange),
    ];

    final List<BarData> barData = [
      BarData(1, 35),
      BarData(2, 23),
      BarData(3, 34),
      BarData(4, 25),
      BarData(5, 40),
    ];
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SfCircularChart(
                      series: <CircularSeries>[
                        DoughnutSeries<ChartData, String>(
                          cornerStyle: CornerStyle.bothCurve,
                          dataSource: chartData,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          innerRadius: "70%",
                          pointColorMapper: (ChartData data, _) => data.color,
                          explodeAll: true,
                          explode: true,
                        )
                      ],
                    ),
                    Text(
                      'My Data',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.rotate(
                angle: -3.14159265 /
                    2, // Rotate 90 degrees counterclockwise (π/2 radians)
                child: Container(
                  color: Colors.blueAccent,
                  width: 200,
                  height: 300,
                  child: SfCartesianChart(
                    series: <ChartSeries>[
                      BarSeries<BarData, double>(
                        gradient: LinearGradient(
                            colors: [Colors.black, Colors.tealAccent]),
                        borderWidth: 4,
                        color: Colors.blueGrey,
                        dataSource: barData,
                        xValueMapper: (BarData data, _) => data.x,
                        yValueMapper: (BarData data, _) => data.y,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 25, 16, 83),
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  width: 300,
                  height: 300,
                  child: SfCartesianChart(
                      plotAreaBorderColor: Colors.transparent,
                      primaryXAxis: CategoryAxis(
                          majorGridLines: MajorGridLines(width: 0),
                          majorTickLines: MajorTickLines(width: 0)),
                      primaryYAxis: NumericAxis(
                        majorGridLines: MajorGridLines(color: Colors.grey),
                        majorTickLines: MajorTickLines(width: 0),
                        minimum: 0,
                        maximum: 40,
                        interval: 10,
                      ),
                      tooltipBehavior: _tooltip,
                      series: <ChartSeries<_ChartData, String>>[
                        ColumnSeries<_ChartData, String>(
                          width: 0.5,
                          gradient: LinearGradient(colors: [
                            Colors.teal.shade900,
                            Colors.tealAccent.shade200
                          ]),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          dataSource: data,
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          name: 'touchworld',
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BarData {
  final double x;
  final double y;

  BarData(this.x, this.y);
}
