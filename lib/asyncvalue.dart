import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'asyncvalue.g.dart';

@riverpod
class AsyncTest extends _$AsyncTest {
  @override
  FutureOr<int> build() {
    return 5;
  }
}

void main() {}
