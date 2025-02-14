import 'package:flutter/material.dart';

void main() {
  runApp(BasicKeyPage());
}

class BasicKeyPage extends StatelessWidget {
  // only works because _CouterWidgetState is in same file
  // global key preconditions: stateful widget + state class is public
  final keyCounter = GlobalKey<_CounterWidgetState>();

  BasicKeyPage({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Global Key'),
            centerTitle: true,
          ),
          body: Center(
            child: CounterWidget(key: keyCounter),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              keyCounter.currentState!.increment();
            },
          ),
        ),
      );
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void increment() => setState(() => counter += 5);

  @override
  Widget build(BuildContext context) => Text(
        'Counter: $counter',
        style: const TextStyle(fontSize: 32),
      );
}
