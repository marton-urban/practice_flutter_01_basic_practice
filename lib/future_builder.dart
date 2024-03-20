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
  Future<int> getData() async {
    await Future.delayed(const Duration(seconds: 4));
    return 7;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Future Builder'),
        ),
        body: Center(
            child: FutureBuilder<int?>(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    int? data = snapshot.data;
                    return Text('✅ $data');
                  } else {
                    return const CircularProgressIndicator();
                  }
                })),
      ));
}
