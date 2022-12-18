import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

final aSubject = BehaviorSubject<int>.seeded(1);

final streamAProvider = StreamProvider<int>((ref) {
  return aSubject.stream;
});



final bSubject = BehaviorSubject<int>.seeded(1);

final streamBProvider = StreamProvider<int>((ref) {
  return bSubject.stream;
});