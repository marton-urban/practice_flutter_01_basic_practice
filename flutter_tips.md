CMD
```
flutter create
flutter run
flutter packages get
```

STATELESS
```
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment 1'),
        ),
        body: TextControl(),
      ),
    );
  }
}
```

STATEFUL
```
import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Ürömhegyi Quiz')),
        body: _question_index < _questions.length
            ? Quiz(_questions, _question_index, _getNextQuestion)
            : Result(_total_score, _resetQuiz),
      ),
    );
  }
}
```

***
Column/Row(children:[])

Center(child)

Container([width](a "double.infinity"), [margin](a "EdgeInsets.all(10)"), child)

***
Text('', [style](a "TextStyle(fontSize: 36, fontWeight: FontWeight.bold)"), [textAlign](a "TextAlign.center"))

***
ElevatedButton(child, onPressed, [style](a "
ElevatedButton.styleFrom (
  primary: Colors.blue,
  onPrimary: Colors.white,
)
OLD:
ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.blue),
  foregroundColor,
)
"))

TextButton(child, onPressed, [style](a "
TextButton.styleFrom (
  primary: Colors.blue,
  onSurface: Colors.red,
)
OLD:
ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.blue),
  foregroundColor,
)
"))

OutlinedButton(child, onPressed, [style](a "
OutlinedButton.styleFrom (
  primary: Colors.blue,
  side: BorderSide(color: Colors.orange),
)
OLD:
ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.blue),
  side: MaterialStateProperty.all(const BorderSide(color: Colors.red)),
),
"))

***
[FOR LOOP](a "
...(questions[_question_index]['answers'] as List<String>).map((answer) {
  return Answer(_answerQuestion, answer);
 }).toList()
")
```
for (var answer in (questions[_question_index]['answers']))
  Answer(answer, _getNextQuestion),
``` 

Bottom Navigation
```
bottomNavigationBar: BottomNavigationBar(
  selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
  currentIndex: _selectedIndex,
  onTap: _onItemTapped,
  items: <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      label: 'Card',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      label: 'Card2',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.card_giftcard),
      label: 'Card3',
    ),
  ],
)
```