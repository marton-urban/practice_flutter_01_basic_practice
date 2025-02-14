// https://medium.com/@NALSengineering/flutter-from-zero-to-hero-part-6-understand-keys-say-bye-to-ui-bugs-faac4f52a2b
// It turns out that when we use UniqueKey, by clicking the button, the TextField gets cleared of all of its text, while it is not the case for ValueKey.
// The reason is that when TextField is rebuilt, a new UniqueKey is created and it is completely different from the old TextField’s one. As a result, the TextField Element cannot find matched TextField Widget so it is disposed of and re-created which leads to losing all of our text.

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(key: ValueKey(1)),
            TextField(key: UniqueKey()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}
