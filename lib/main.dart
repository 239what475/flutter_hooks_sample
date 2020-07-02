import 'package:flutter/material.dart';
import 'package:flutter_hooks_sample/src/riverpod_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hellWorldProvider = Provider((_) => 'Hello World');

void main() {
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}
