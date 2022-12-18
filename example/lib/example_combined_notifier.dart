import 'package:example/example_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example_combined_notifier.g.dart';

@riverpod
class ExampleCombinedNotifier extends _$ExampleCombinedNotifier {
  @override
  FutureOr<int> build() async {
    final list = await ref.watch(exampleNotifierProvider.future);

    return list.first;
  }
}
