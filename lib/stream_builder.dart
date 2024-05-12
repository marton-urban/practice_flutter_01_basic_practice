import 'package:flutter/material.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Stream<int?> dataStream;

  @override
  void initState() {
    super.initState();
    dataStream = getData();
  }

  Stream<int?> getData() async* {
    await Future.delayed(const Duration(seconds: 4));
    yield 1;
    await Future.delayed(const Duration(seconds: 1));
    yield 2;
    await Future.delayed(const Duration(seconds: 1));
    yield 3;
    // yield null;
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
                  dataStream = getData();
                })),
        body: Center(
            child: StreamBuilder<int?>(
          stream: dataStream,
          initialData: 0, // never shown in this example
          builder: (builder, snapshot) => switch (snapshot.connectionState) {
            ConnectionState.none => Text('${snapshot.data}'), // never shown
            ConnectionState.waiting => const CircularProgressIndicator(),
            _ => snapshot.hasData
                ? Text('${snapshot.data}')
                : snapshot.hasError
                    ? Text('🥺${snapshot.error}')
                    : const Text('No data'),
          },
        )),
      ));
}
