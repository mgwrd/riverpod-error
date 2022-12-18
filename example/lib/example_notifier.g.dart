// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String $ExampleNotifierHash() => r'5771725bd7c82faab8905789f504fd4e00b2dce2';

/// See also [ExampleNotifier].
final exampleNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ExampleNotifier, List<int>>(
  ExampleNotifier.new,
  name: r'exampleNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $ExampleNotifierHash,
);
typedef ExampleNotifierRef = AutoDisposeAsyncNotifierProviderRef<List<int>>;

abstract class _$ExampleNotifier extends AutoDisposeAsyncNotifier<List<int>> {
  @override
  FutureOr<List<int>> build();
}
