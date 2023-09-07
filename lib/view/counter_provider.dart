import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter_id/model/provider/state_provider.dart';
// Import your provider class

class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Counter Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Count:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${counterProvider.count}',
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => counterProvider.decrement(),
                  child: IconButton(
                      onPressed: () {
                        counterProvider.decrement();
                      },
                      icon: const Icon(Icons.remove)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () => counterProvider.increment(),
                    child: IconButton(
                        onPressed: () {
                          counterProvider.increment();
                        },
                        icon: const Icon(Icons.add))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
