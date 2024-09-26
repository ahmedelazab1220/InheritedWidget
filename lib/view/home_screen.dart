import 'package:flutter/material.dart';
import 'package:inheritedwidget/controller/inherited_state.dart';

/// State Life Cycle:
/// 1. createState
/// 2. initState
/// 3. didChangeDependencies
/// 4. build
/// 5. didUpdateWidget
/// 6. deactivate
/// 7. dispose

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var state = StateInheritedWidget.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              state.counter.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Click On Button To Select New Color'),
              icon: const Icon(Icons.ac_unit_outlined),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          state.incrementCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
