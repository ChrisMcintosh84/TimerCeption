import 'package:flutter/cupertino.dart';

import '../views/timer_view.dart';

class MainController extends ChangeNotifier {
  List<TimerView> _timerViewList = [];

  List<TimerView> get timerViewList => _timerViewList;
}