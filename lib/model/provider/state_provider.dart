import 'package:flutter/material.dart';

class Counter {
  int count;

  Counter(this.count);
}

class CounterProvider extends ChangeNotifier {
  final Counter _counter = Counter(0);

  int get count => _counter.count;

  void increment() {
    _counter.count++;
    notifyListeners();
    print(count);
  }

  void decrement() {
    _counter.count--;
    notifyListeners();
    print(count);
  }
}
