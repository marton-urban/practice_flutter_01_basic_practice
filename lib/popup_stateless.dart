import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainPage(isChecked: false)));
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
    required this.isChecked,
  });

  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pop-up Alert Dialog'),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Checkbox: ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                          value: isChecked,
                          onChanged: (newValue) => Navigator.pushReplacement(
                              context,
                              // instead of MaterialPageRoute, no animations like that
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        MainPage(isChecked: newValue!),
                              ))),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => DialogWidget(isChecked: isChecked)),
                  child: const Text('Open Dialog'),
                )
              ],
            )));
  }
}

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key, required this.isChecked});

  final bool isChecked;

  @override
  Widget build(BuildContext context) => AlertDialog(
          alignment: Alignment.topCenter,
          title: const Text('SetState In Dialog?'),
          content: CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                isChecked ? 'Yes' : 'No',
                style: const TextStyle(fontSize: 24),
              ),
              value: isChecked,
              onChanged: (newValue) {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          MainPage(isChecked: newValue!),
                    ));
                showDialog(
                    context: context,
                    builder: (context) => DialogWidget(isChecked: newValue!));
              }),
          actions: [
            TextButton(
              child: const Text('SUBMIT'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ]);
}
