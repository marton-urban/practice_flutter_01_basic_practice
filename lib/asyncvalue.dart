import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'asyncvalue.g.dart';

// proof that even NotifierProvider can produce AsyncValue
@riverpod
class Notif extends _$Notif {
  @override
  AsyncValue<int> build() {
    return AsyncData(5);
  }
}

@riverpod
class AsyncNotif extends _$AsyncNotif {
  @override
  FutureOr<int> build() {
    return 5;
    // return Future.value(5);
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final test1 = ref.watch(asyncNotifProvider);
    print(test1);
    final test2 = ref.watch(notifProvider);
    print(test2);
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
