import 'package:csv/csv.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopulatedGraph extends StatefulWidget {
  const PopulatedGraph({super.key});

  @override
  State<PopulatedGraph> createState() => _PopulatedGraphState();
}

class _PopulatedGraphState extends State<PopulatedGraph> {
  List<List<dynamic>> _populatedData = [];

  void _loadCsv() async {
    final bareData = await rootBundle.loadString('assets/csv_file.csv');
    List<List<dynamic>> convertedData =
        const CsvToListConverter().convert(bareData);
    print(convertedData);
    setState(() {
      _populatedData = convertedData;
    });
  }

  Widget bottomTitles(TitleMeta meta, index) {
    //final names = _populatedData[index][1].toString();

    final Widget text = Text(_populatedData[index][1].toString());

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CSV file loaded...'),
      ),
      body: BarChart(
        BarChartData(
          borderData: FlBorderData(
            border: const Border(
              bottom: BorderSide(width: 5, color: Color.fromARGB(255, 0, 0, 0)),
              left: BorderSide(width: 5, color: Color.fromARGB(255, 0, 0, 0)),
              right: BorderSide.none,
              top: BorderSide.none,
            ),
          ),
          groupsSpace: 100,
          gridData: const FlGridData(show: true),
          titlesData: const FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                getTitlesWidget: bottomTitles,
                // getTitlesWidget: bottomTitles,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 50,
                //getTitlesWidget: leftTitles,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadCsv,
        child: const Icon(Icons.add),
      ),
    );
  }
}
