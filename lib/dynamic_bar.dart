import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CreateBarChart extends StatefulWidget {
  const CreateBarChart({super.key});

  @override
  State<CreateBarChart> createState() => _CreateBarChartState();
}

class _CreateBarChartState extends State<CreateBarChart> {
  final double width = 15;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12, "RIB", "CIB");
    final barGroup2 = makeGroupData(1, 16, 12, "RIB", "CIB");
    final barGroup3 = makeGroupData(2, 18, 5, "RIB", "CIB");
    final barGroup4 = makeGroupData(3, 20, 16, "RIB", "CIB");
    final barGroup5 = makeGroupData(4, 17, 6, "RIB", "CIB");
    final barGroup6 = makeGroupData(5, 19, 30, "RIB", "CIB");
    final barGroup7 = makeGroupData(6, 10, 30, "RIB", "CIB");

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  BarChartGroupData makeGroupData(
      int x, double y1, double y2, String label1, String label2) {
    return BarChartGroupData(
      barsSpace: 10,
      x: x,
      showingTooltipIndicators: [0, 1],
      groupVertically: false,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: Colors.amber,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: Colors.blue,
          width: width,
        ),
      ],
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color.fromARGB(255, 89, 93, 97),
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    String text;

    if (value == 0) {
      text = "1K";
    } else if (value == 10) {
      text = "5K";
    } else if (value == 20) {
      text = "10K";
    } else if (value == 30) {
      text = "15K";
    } else {
      return Container();
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: BarChart(
                BarChartData(
                  maxY: 30,
                  borderData: FlBorderData(
                    border: const Border(
                      bottom: BorderSide(width: 3),
                      top: BorderSide.none,
                      left: BorderSide(width: 3),
                      right: BorderSide.none,
                    ),
                  ),
                  barGroups: showingBarGroups,
                  groupsSpace: 100,
                  gridData: const FlGridData(show: true),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: false,
                    )),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
                        getTitlesWidget: bottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 50,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
