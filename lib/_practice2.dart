import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

class DataSeries {
  final List<DataItem> dataModel;
  DataSeries({required this.dataModel});
  factory DataSeries.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataItem> dataList =
        list.map((dataModel) => DataItem.fromJson(dataModel)).toList();
    return DataSeries(dataModel: dataList);
  }
}

class DataItem {
  final String title;
  DataItem({required this.title});
  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(title: json['title']);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local JSON Future Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Local JSON Future Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<String> _loadAssetData() async {
  return await rootBundle.loadString('assets/example2.json');
}

class _MyHomePageState extends State<MyHomePage> {
  Future<DataSeries> fetchData() async {
    String jsonString = await _loadAssetData();
    final jsonResponse = json.decode(jsonString);
    DataSeries dataSeries = DataSeries.fromJson(jsonResponse);
    return dataSeries;
  }

  late Future<DataSeries> dataSeries;
  @override
  void initState() {
    super.initState();
    dataSeries = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<DataSeries>(
          future: dataSeries,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.dataModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data!.dataModel[index].title),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
