// https://www.youtube.com/watch?v=WhnB_5yjyWQ

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(UniqueKeyPage());
}

class UniqueKeyPage extends StatefulWidget {
  @override
  createState() => _UniqueKeyPageState();
}

class _UniqueKeyPageState extends State<UniqueKeyPage> {
  late List<Widget> children;

  @override
  void initState() {
    super.initState();

    children = [
      ColorStateWidget(key: UniqueKey(), text: '1'),
      ColorStateWidget(key: UniqueKey(), text: '2'),
      // Container(key: UniqueKey(), child: ColorStateWidget(text: '1')),
      // Container(key: UniqueKey(), child: ColorStateWidget(text: '2')),
    ];
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Unique Key'),
            centerTitle: true,
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: swapTiles,
            child: const Icon(Icons.swap_horiz, size: 32),
          ),
        ),
      );

  void swapTiles() => setState(() {
        final child = children.removeAt(0);
        children.insert(1, child);
      });
}

class ColorStateWidget extends StatefulWidget {
  final String text;

  const ColorStateWidget({
    super.key,
    required this.text,
  });

  @override
  ColorStateWidgetState createState() => ColorStateWidgetState();
}

class ColorStateWidgetState extends State<ColorStateWidget> {
  late Color color;

  @override
  void initState() {
    super.initState();

    color = generateColor();
  }

  Color generateColor() {
    final random = Random();

    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        width: 150,
        height: 150,
        child: Center(
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
