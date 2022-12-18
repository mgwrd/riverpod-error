import 'dart:math';

import 'package:example/stream_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'example_notifier.g.dart';

@riverpod
class ExampleNotifier extends _$ExampleNotifier {
  @override
  FutureOr<List<int>> build() async {
    final a = await ref.watch(streamAProvider.future);
    final b = await ref.watch(streamBProvider.future);

    return [a, b];
  }

  Future<void> updateStreams() async {
    state = AsyncLoading<List<int>>().copyWithPrevious(state);
    update((state) async {
      final a = Random().nextInt(20);
      final b = Random().nextInt(20);
      await Future.delayed(const Duration(milliseconds: 2000));
      aSubject.add(a);
      bSubject.add(b);
      return [a,b];
    });
  }
}
