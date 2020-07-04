import 'dart:math';

import 'package:flutter_hooks_sample/riverpod/di.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'sample_state.dart';

//final sampleProvider =
//    AutoDisposeStateNotifierProvider((ref) => SampleNotifier(ref));
final sampleProvider =
    AutoDisposeStateNotifierProviderFamily<SampleNotifier, int>(
        (ref, value) => SampleNotifier(ref, value));

class SampleNotifier extends StateNotifier<SampleState> {
  SampleNotifier(this._ref, this.id) : super(const SampleState()) {
    Future.delayed(const Duration(milliseconds: 1000), _load);
  }

  final ProviderReference _ref;
  final int id;

  @override
  void dispose() {
    super.dispose();
    print('dispose $runtimeType');
  }

  void _load() {
    state = state.copyWith(
        message: _ref.read(sampleRepositoryProvider).loadMessage());
  }

  void changeMessage() {
    state = state.copyWith(message: Random().nextInt(100).toString());
  }
}
