// https://www.youtube.com/watch?v=THMcgdtUtFQ
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainPage()));
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isChecked = false;

  void refreshCheckboxState(bool? newValue) {
    setState(() => isChecked = newValue!);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      value: isChecked,
                      onChanged: refreshCheckboxState,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                //if setState is deleted from below, then this needs to be:
                // () async {await openDialog(); setState(() {});};
                onPressed: openDialog,
                child: const Text('Open Dialog'),
              )
            ],
          )));

  Future openDialog() => showDialog(
      context: context,
      // need StatefulBuilder for setState2
      builder: (context) => StatefulBuilder(builder: (context, setState2) {
            return AlertDialog(
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
                      setState2(() => isChecked = newValue!);
                      setState(() => {});
                    }),
                actions: [
                  TextButton(
                    child: const Text('SUBMIT'),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ]);
          }));
}
