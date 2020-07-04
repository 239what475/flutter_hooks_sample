import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_state.freezed.dart';

@freezed
abstract class SampleState with _$SampleState {
  const factory SampleState({
    @Default('') String message,
  }) = _SampleState;
}
