// https://www.youtube.com/watch?v=WQpPMYxxTfg

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SameValuesPage());
}

class SameValuesPage extends StatefulWidget {
  @override
  createState() => _SameValuesPageState();
}

class _SameValuesPageState extends State<SameValuesPage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();
// const will NOT work for this example; only max one of them can be const here
    final peter1 = User(
      name: 'Peter Drucker',
      country: 'USA',
    );

    final peter2 = User(
      name: 'Peter Drucker',
      country: 'USA',
    );

    users = [
      peter1,
      peter2,
      const User(
        name: 'Sarah Abs',
        country: 'England',
      ),
      const User(
        name: 'James High',
        country: 'India',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Object Key'),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: users
                  .map<Widget>((user) => UserWidget(
                        key: ObjectKey(user),
                        user: user,
                      ))
                  .toList(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: swapTiles,
            child: const Icon(Icons.swap_horiz, size: 32),
          ),
        ),
      );

  void swapTiles() => setState(() {
        final user = users.removeAt(0);
        users.insert(1, user);
      });
}

class UserWidget extends StatefulWidget {
  final User user;

  const UserWidget({
    super.key,
    required this.user,
  });

  @override
  createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
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
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(widget.user.name),
          subtitle: Text(widget.user.country),
          trailing: Text('HashCode: ${widget.user.hashCode}'),
        ),
      );
}

class User {
  final String name;
  final String country;

  const User({
    required this.name,
    required this.country,
  });

  // Another video: https://youtu.be/-F_5yHm_Zso?si=escK47GI_zQUofXn&t=299
  // == must be overriden, but here if you don't override hashcode will be different, and even ValueKey(user) will work.

  // @override
  // bool operator ==(Object other) =>
  //     identical(this, other) ||
  //     other is User &&
  //         runtimeType == other.runtimeType &&
  //         name == other.name &&
  //         country == other.country;

  // @override
  // int get hashCode => name.hashCode ^ country.hashCode;
}
