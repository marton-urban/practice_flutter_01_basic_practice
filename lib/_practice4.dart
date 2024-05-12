import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ExampleProvider(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              Text(context.watch<int>().toString()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.read<ExampleProviderState>().increment(),
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
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
    return Provider<int>.value(
      value: _count,
      child: Provider.value(
        value: this,
        child: widget.child,
      ),
    );
  }
}
