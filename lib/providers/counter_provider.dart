import 'package:flutter_study/data/counter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
Counter counter(CounterRef ref) => Counter(count: 0);
