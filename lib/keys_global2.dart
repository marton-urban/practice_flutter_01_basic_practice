import 'package:flutter/material.dart';

void main() {
  runApp(FormKeyPage());
}

class FormKeyPage extends StatefulWidget {
  const FormKeyPage({super.key});

  @override
  createState() => _FormKeyPageState();
}

class _FormKeyPageState extends State<FormKeyPage> {
  final formKey = GlobalKey<FormState>();

  bool isSignedIn = false;
  String email = '';
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Global Key 2'),
            centerTitle: true,
          ),
          body: isSignedIn ? buildHome() : buildLogin(),
        ),
      );

  Widget buildLogin() => Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && !value.contains('@')
                  ? 'Not a Valid Email!'
                  : null,
              onSaved: (value) => email = value!,
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.length < 3
                  ? 'Username needs 3 characters.'
                  : null,
              onSaved: (value) => username = value!,
            ),
            const SizedBox(height: 24),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) => value != null && value.length < 3
                  ? 'Password needs 3 characters.'
                  : null,
              onSaved: (value) => password = value!,
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Submit',
              onClicked: submit,
            ),
          ],
        ),
      );

  Widget buildHome() => Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextRowWidget(title: 'Email', value: email),
            TextRowWidget(title: 'User', value: username),
            TextRowWidget(title: 'Password', value: password),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Sign Out',
              onClicked: () => setState(() => isSignedIn = false),
            ),
          ],
        ),
      );

  void submit() {
    final form = formKey.currentState!;

    if (form.validate()) {
      form.save();

      setState(() => isSignedIn = true);
    }
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
        onPressed: onClicked,
        child: FittedBox(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      );
}

class TextRowWidget extends StatelessWidget {
  final String title;
  final String value;

  const TextRowWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      );
}
