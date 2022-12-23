import 'package:example/example_combined_notifier.dart';
import 'package:example/example_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: MyApp(),
    ),
  );
}

// Extend ConsumerWidget instead of StatelessWidget, which is exposed by Riverpod
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ! if this provider is changed to exampleNotifierProvider the error does not occur
    final exampleProvider = ref.watch(exampleCombinedNotifierProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Example')),
        body: Column(
          children: [
            exampleProvider.map(
              data: (data) => Text(data.value),
              error: (data) => Text(data.error.toString()),
              loading: (_) => const CircularProgressIndicator(),
            ),
            ElevatedButton(
                onPressed: () {
                  ref.watch(exampleNotifierProvider.notifier).updateStreams();
                },
                child: const Text("update"))
          ],
        ),
      ),
    );
  }
}
