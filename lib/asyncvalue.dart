import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'asyncvalue.g.dart';

@riverpod
class AsyncTest extends _$AsyncTest {
  @override
  FutureOr<int> build() {
    return 5;
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testing = ref.watch(asyncTestProvider);
    print(testing);
    return Container();
  }
}

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
