import 'package:flutter_study/model/counter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter.g.dart';

@riverpod
Counter counter(CounterRef ref) => const Counter(count: 0);
