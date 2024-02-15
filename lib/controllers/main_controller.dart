import 'package:flutter/cupertino.dart';
import 'package:timerception/controllers/timer_controller.dart';

import '../views/timer_view.dart';

class MainController extends ChangeNotifier {
  List<TimerView> _timerViewList = [];

  List<TimerView> get timerViewList => _timerViewList;

  void addNewTimer() {
    timerViewList.add(TimerView(timerController: TimerController()));
    notifyListeners();
  }
}