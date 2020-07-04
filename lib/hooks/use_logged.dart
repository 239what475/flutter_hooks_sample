import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class Logged {
  ValueNotifier<T> useLoggedState<T>([T initialData]) {
    final result = useState<T>(initialData);
    useValueChanged(result.value, (T _, T __) {
      print(result.value);
    });
    return result;
  }
}

Logged useLogged() => useContext().watch<Logged>();
