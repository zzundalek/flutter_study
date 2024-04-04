import 'package:flutter_study/model/counter.dart' as model;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  model.Counter build() => const model.Counter(count: 0);

  void increment() => state = state.copyWith(count: state.count + 1);
}
