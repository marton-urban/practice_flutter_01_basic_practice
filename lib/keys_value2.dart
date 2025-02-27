import 'package:flutter/material.dart';

void main() {
  runApp(AdvancedKeyPage());
}

class User {
  final String name;
  final String urlImage;

  const User({
    required this.name,
    required this.urlImage,
  });
}

class AdvancedKeyPage extends StatefulWidget {
  const AdvancedKeyPage({super.key});

  @override
  createState() => _AdvancedKeyPageState();
}

class _AdvancedKeyPageState extends State<AdvancedKeyPage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    users = [
      const User(
        name: 'Sarah Abs',
        urlImage:
            'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
      ),
      const User(
        name: 'James High',
        urlImage:
            'https://images.unsplash.com/photo-1552058544-f2b08422138a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=644&q=80',
      ),
      const User(
        name: 'Peter Drucker',
        urlImage:
            'https://images.unsplash.com/photo-1548543604-a87c9909abec?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Value Key 2'),
            centerTitle: true,
          ),
          body: ReorderableListView.builder(
            itemCount: users.length,
            onReorder: (oldIndex, newIndex) => setState(() {
              final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

              final user = users.removeAt(oldIndex);
              users.insert(index, user);
            }),
            itemBuilder: (context, index) {
              final user = users[index];

              return buildUser(index, user);
            },
          ),
        ),
      );

  Widget buildUser(int index, User user) => ListTile(
        key: ValueKey(user.name),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.urlImage),
          radius: 30,
        ),
        title: Text(user.name),
      );
}
