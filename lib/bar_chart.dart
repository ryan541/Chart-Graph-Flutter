import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  const MyBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Csv List Converter"),
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('CSV Bar Chart'),
              SizedBox(
                width: 20,
              ),
              Text('Complete Design'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: BarChart(
                BarChartData(
                    borderData: FlBorderData(
                      border: const Border(
                        bottom: BorderSide(width: 1),
                        top: BorderSide.none,
                        left: BorderSide(width: 1),
                        right: BorderSide.none,
                      ),
                    ),
                    groupsSpace: 100,
                    titlesData: const FlTitlesData(),
                    barGroups: [
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(toY: 10, width: 20, color: Colors.amber)
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(toY: 15, width: 20, color: Colors.blue)
                      ]),
                      BarChartGroupData(x: 3, barRods: [
                        BarChartRodData(toY: 20, width: 20, color: Colors.red)
                      ]),
                      BarChartGroupData(x: 4, barRods: [
                        BarChartRodData(
                            toY: 25,
                            width: 20,
                            color: const Color.fromARGB(255, 255, 0, 200))
                      ]),
                      BarChartGroupData(x: 5, barRods: [
                        BarChartRodData(
                            toY: 30,
                            width: 20,
                            color: const Color.fromARGB(255, 11, 255, 3))
                      ]),
                      BarChartGroupData(x: 6, barRods: [
                        BarChartRodData(
                            toY: 25,
                            width: 20,
                            color: const Color.fromARGB(255, 213, 2, 255))
                      ]),
                      BarChartGroupData(x: 7, barRods: [
                        BarChartRodData(
                            toY: 23,
                            width: 20,
                            color: const Color.fromARGB(255, 238, 255, 6))
                      ]),
                      BarChartGroupData(x: 8, barRods: [
                        BarChartRodData(
                            toY: 10,
                            width: 20,
                            color: const Color.fromARGB(255, 48, 167, 58))
                      ]),
                      BarChartGroupData(x: 9, barRods: [
                        BarChartRodData(
                            toY: 3,
                            width: 20,
                            color: const Color.fromARGB(255, 0, 0, 0))
                      ]),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
