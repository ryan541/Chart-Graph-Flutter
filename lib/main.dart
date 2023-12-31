import 'package:csv_read/bar_chart.dart';
import 'package:csv_read/dynamic_bar.dart';
import 'package:csv_read/graphs/graph_data.dart';
import 'package:csv_read/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PopulatedGraph(),
    );
  }
}
