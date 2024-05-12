// https://medium.com/flutter-community/understanding-provider-in-diagrams-part-2-basic-providers-1a80fb74d4e7
// https://pub.dev/packages/provider (ValueListenableProvider is removed from version 5)
// optional: add ValueListenableBuilder's child attribute so Scaffold won't get rebuilt

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class CountDown extends ValueNotifier<int> {
  CountDown(super.value) {
    scheduleDecrement();
  }

  void scheduleDecrement() {
    Future.delayed(const Duration(seconds: 1), () {
      if (--value > 0) scheduleDecrement();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'ValueListenerProvider Demo';
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ValueListenableBuilder<int>(
          valueListenable: CountDown(10),
          builder: (context, value, _) {
            return Provider<int>.value(
                value: value,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text(appTitle),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Consumer<int>(
                          builder: (context, count, child) {
                            if (count > 0) {
                              return Text("T minus $count seconds");
                            }
                            return const Text("Blast off!");
                          },
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
