import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime.parse('2011-12-01'), 35),
      SalesData(DateTime.parse('2012-12-01'), 28),
      SalesData(DateTime.parse('2013-12-01'), 34),
      SalesData(DateTime.parse('2014-12-01'), 32),
      SalesData(DateTime.parse('2015-12-01'), 40)
    ];

    return Scaffold(
      body: Center(
        child: SfCartesianChart(
          primaryXAxis: const DateTimeAxis(),
          series: <CartesianSeries>[
            // Renders line chart
            LineSeries<SalesData, DateTime>(
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
            )
          ],
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
