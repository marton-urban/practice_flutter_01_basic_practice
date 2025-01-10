import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_simple_chat'),
        ),
        body: Column(
          children: [
            MessageBubble(
              text: "How was the concert?",
              isCurrentUser: false,
            ),
            MessageBubble(
              text:
                  "Awesome! Next time you gotta come as well! Awesome! Next time you gotta come as well!",
              isCurrentUser: true,
            ),
            MessageBubble(
              text: "Ok, when is the next date?",
              isCurrentUser: false,
            ),
            MessageBubble(
              text: "They're playing on the 20th of November",
              isCurrentUser: true,
            ),
            MessageBubble(
              text: "Let's do it!",
              isCurrentUser: false,
            ),
          ],
        ),
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.text,
    required this.isCurrentUser,
  });

  final String text;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          if (isCurrentUser) Spacer(),
          DecoratedBox(
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isCurrentUser ? Colors.white : Colors.black87,
                    ),
              ),
            ),
          ),
          if (!isCurrentUser) Spacer(),
        ],
      ),
    );
  }
}
