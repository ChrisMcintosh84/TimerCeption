import 'package:flutter/cupertino.dart';

import '../models/counter.dart';

class CounterController extends ChangeNotifier {
  List<Counter> counters = [];

  void addCounter() {
    counters.add(Counter(0));
    notifyListeners();
  }

  void removeCounter(int index) {
    counters.removeAt(index);
    notifyListeners();
  }

  void increaseCounter(int index) {
    counters[index].count++;
    notifyListeners();
  }

  void decreaseCounter(int index) {
    if (counters[index].count > 0) {
      counters[index].count--;
      notifyListeners();
    }
  }
}