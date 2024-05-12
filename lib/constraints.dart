import 'package:flutter/material.dart';

void main() => runApp(const HomePage());

const red = Colors.red;
const green = Colors.green;
const blue = Colors.blue;
const big = TextStyle(fontSize: 30);

//////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Practice',
        home: Material(
            child: Center(
                child: Container(
                    width: 406,
                    height: 353,
                    decoration: BoxDecoration(border: Border.all(width: 3)),
                    child: Container(
                        padding: const EdgeInsets.all(32),
                        child: Row(
                          children: [
                            Expanded(
                              /*1*/
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /*2*/
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: const Text(
                                      'Oeschinen Lake Campground',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Kandersteg, Switzerland',
                                    style: TextStyle(
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            /*3*/
                            Icon(
                              Icons.star,
                              color: Colors.red[500],
                            ),
                            const Text('41'),
                          ],
                        ))))));
  }
}
