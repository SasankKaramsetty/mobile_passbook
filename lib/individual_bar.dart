import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IndividualBar {
  final int x;
  final double y;
  IndividualBar({required this.x, required this.y});
}

class Bardata {
  final double sunammount;
  final double monammount;
  final double tueammount;
  final double wedammount;
  final double thuammount;
  final double friammount;
  final double satammount;
  Bardata({
    required this.sunammount,
    required this.monammount,
    required this.tueammount,
    required this.wedammount,
    required this.thuammount,
    required this.friammount,
    required this.satammount,
  });
  List<IndividualBar> bardata = [];
  void initializeBarData() {
    bardata = [
      IndividualBar(x: 0, y: sunammount),
      IndividualBar(x: 1, y: monammount),
      IndividualBar(x: 2, y: tueammount),
      IndividualBar(x: 3, y: wedammount),
      IndividualBar(x: 4, y: thuammount),
      IndividualBar(x: 5, y: friammount),
      IndividualBar(x: 6, y: satammount),
    ];
  }
}

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunammount;
  final double monammount;
  final double tueammount;
  final double wedammount;
  final double thuammount;
  final double friammount;
  final double satammount;

  const MyBarGraph({
    required this.maxY,
    required this.sunammount,
    required this.monammount,
    required this.tueammount,
    required this.wedammount,
    required this.thuammount,
    required this.friammount,
    required this.satammount,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize the bar data
    Bardata mybardata = Bardata(
      sunammount: sunammount,
      monammount: monammount,
      tueammount: tueammount,
      wedammount: wedammount,
      thuammount: thuammount,
      friammount: friammount,
      satammount: satammount,
    );
    mybardata.initializeBarData();

    // Prepare the bar chart data
    // List<BarChartGroupData> barChartGroupData = [];
    return BarChart(
      BarChartData(
        maxY: maxY,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getbottomtitles)),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: false),
        barGroups: mybardata.bardata
            .map(
              (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                    toY: data.y,
                    color: Colors.white,
                    width: 20,
                    backDrawRodData: BackgroundBarChartRodData(
                      show: true,
                      toY: maxY,
                      color: Color(0xff8E44AD),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getbottomtitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Sun', style: style);
      break;
    case 1:
      text = const Text('Mon', style: style);
      break;
    case 2:
      text = const Text('Tue', style: style);
      break;
    case 3:
      text = const Text('Wed', style: style);
      break;
    case 4:
      text = const Text('Thu', style: style);
      break;
    case 5:
      text = const Text('Fri', style: style);
      break;
    case 6:
      text = const Text('Sat', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
