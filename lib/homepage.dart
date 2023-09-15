import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<dynamic>> _dataList = [];

  void _loadCsv() async {
    final rawData = await rootBundle.loadString("assets/csv_file.csv");
    List<List<dynamic>> convertedData =
        const CsvToListConverter().convert(rawData);
    print(convertedData);

    setState(() {
      _dataList = convertedData.sublist(1, 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Csv List Converter"),
      ),
      body: ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: (ctx, index) {
          final adjustedIndex = index + 1;
          return Card(
            margin: const EdgeInsets.all(10),
            color: index == 0 ? Colors.amber : Colors.blueAccent,
            elevation: 3,
            child: ListTile(
              leading: Text(_dataList[index][0].toString()),
              title: Text(_dataList[index][1].toString()),
              trailing: Text(_dataList[index][2].toString()),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadCsv,
        child: const Icon(Icons.add),
      ),
    );
  }
}
