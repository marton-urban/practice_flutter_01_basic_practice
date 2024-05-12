import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<int?> dataFuture;

  @override
  void initState() {
    super.initState();
    dataFuture = getData();
  }

  Future<int?> getData() async {
    final result = await http
        .get(Uri.parse('https://www.randomnumberapi.com/api/v1.0/random'));
    await Future.delayed(const Duration(seconds: 3));
    final body = json.decode(result.body);
    int randomNumber = (body as List).first;
    return randomNumber;
    // return null;
    // throw 'An error';
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Future Builder'),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () => setState(() {
                  dataFuture = getData();
                })),
        body: Center(
            child: FutureBuilder<int?>(
                future: dataFuture,
                initialData: 5, // never shown in this example
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('🥺${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Text('✅ ${snapshot.data}');
                  } else {
                    return const Text('No data');
                  }
                })),
      ));
}
