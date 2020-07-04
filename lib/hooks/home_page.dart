import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'use_logged.dart';

class HomePage extends HookWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        Provider<Logged>(
          create: (_) => Logged(),
        ),
      ],
      child: const HomePage(
        title: 'Flutter Hooks Sample',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);

    useEffect(() {
      print('mounted');
      return;
    }, []);

    useEffect(() {
      print('count up ${counter.value}');
      return;
    }, [counter.value]);

    useValueChanged<int, void>(counter.value, (oldValue, oldResult) {
      print('useValueChanged $oldValue');
      return;
    });

    final resultMemo = useMemoized<int>(() {
      const value = 10 * 10 * 10;
      print('useMemoized $value');
      return value;
    });
    print('resultMemo $resultMemo');

    final logged = useLogged();
    final loggedResult = logged.useLoggedState<int>(0);
    print('loggedResult ${loggedResult.value}');

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
//          loggedResult.value++;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
