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
ElevatedButton(child, onPressed, [style](a "ElevatedButton.styleFrom (
  primary: Colors.blue,
  onPrimary: Colors.white,
)
OLD:
style: ButtonStyle(
  backgroundColor: StateProperty.all(Colors.blue),
  foregroundColor,
)"))

TextButton(child, onPressed, [style](a "TextButton.styleFrom (
  primary: Colors.blue,
  onSurface: Colors.red,
)
OLD:
style: ButtonStyle(
  backgroundColor: StateProperty.all(Colors.blue),
  foregroundColor,
)"))

OutlinedButton(child, onPressed, [style](a "OutlinedButton.styleFrom (
  side: BorderSide(color: Colors.orange,)
)
OLD:
style:
  ButtonStyle(
    backgroundColor: StateProperty.all(Colors.blue),
    foregroundColor,
  ),
  BorderStyle(side)
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
