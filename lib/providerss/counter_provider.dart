import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  // event to set or chnage the data // i.e all the data relatedd functions will be carried here.

  void increment() {
    _count++;
    notifyListeners(); // this is most imp, to notify all the listeners that data has changed.
  }

  void decrement() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  //getter

  int getCount() => _count;
}
