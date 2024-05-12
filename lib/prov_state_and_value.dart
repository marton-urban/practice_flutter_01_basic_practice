// https://medium.com/flutter-community/understanding-provider-in-diagrams-part-2-basic-providers-1a80fb74d4e7
// Plain Vanilla Provider, but updated to use MultiProvider instead of nested providers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ExampleProvider(child: MaterialApp(home: MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<int>(builder: (_, counter, __) => Text('$counter')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ExampleProviderState>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ExampleProvider extends StatefulWidget {
  const ExampleProvider({super.key, required this.child});

  final Widget child;

  @override
  ExampleProviderState createState() => ExampleProviderState();
}

class ExampleProviderState extends State<ExampleProvider> {
  int _count = 0;

  void increment() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<int>.value(value: _count),
        Provider.value(value: this),
      ],
      child: widget.child,
    );
  }
}
