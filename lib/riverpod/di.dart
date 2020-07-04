import 'package:flutter_hooks_sample/riverpod/model/repository/sample_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sampleRepositoryProvider =
    Provider<SampleRepository>((_) => SampleDataSource());
