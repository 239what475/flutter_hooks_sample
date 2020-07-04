import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_sample/riverpod/model/sample_notifier.dart';
import 'package:flutter_hooks_sample/riverpod/model/sample_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodStateNotifierPage extends HookWidget {
  const RiverpodStateNotifierPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(sampleProvider(0));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Riverpod state notifier sample page.',
            ),
            _Text()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: notifier.changeMessage,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _Text extends HookWidget {
  const _Text({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      useProvider(
          sampleProvider(0).state.select((SampleState state) => state.message)),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
