// https://www.youtube.com/watch?v=-F_5yHm_Zso

import 'package:flutter/material.dart';

void main() {
  runApp(BasicKeyPage());
}

class BasicKeyPage extends StatefulWidget {
  @override
  createState() => _BasicKeyPageState();
}

class _BasicKeyPageState extends State<BasicKeyPage> {
  bool showEmail = true;

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Value Key'),
            centerTitle: true,
          ),
          body: Container(
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (showEmail)
                    const TextField(
                      key: ValueKey(
                          1), // or Key('1') which is same as ValueKey<String>('1')
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  const SizedBox(height: 16),
                  const TextField(
                    key: ValueKey(2),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            icon: const Icon(Icons.visibility_off),
            label: const Text('Remove Email'),
            onPressed: () => setState(() => showEmail = false),
          ),
        ),
      );
}
